/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AlamofireImplementations.swift">
 *  Copyright (c) 2022 Aspose.HTML for Cloud
 * </copyright>
 * <summary>
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 * </summary>
 * --------------------------------------------------------------------------------------------------------------------
 */

import Foundation
import Alamofire

class AlamofireRequestBuilderFactory: RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type {
        return AlamofireRequestBuilder<T>.self
    }

    func getBuilder<T:Decodable>() -> RequestBuilder<T>.Type {
        return AlamofireDecodableRequestBuilder<T>.self
    }
}

// Store manager to retain its reference
private var managerStore: [String: Alamofire.SessionManager] = [:]

open class AlamofireRequestBuilder<T>: RequestBuilder<T> {
    required public init(method: String, URLString: String, parameters: [String : Any]?, isBody: Bool, headers: [String : String] = [:]) {
        super.init(method: method, URLString: URLString, parameters: parameters, isBody: isBody, headers: headers)
    }

    /**
     May be overridden by a subclass if you want to control the session
     configuration.
     */
    open func createSessionManager() -> Alamofire.SessionManager {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 1200
        configuration.timeoutIntervalForResource = 1200
        configuration.httpAdditionalHeaders = buildHeaders()
        return Alamofire.SessionManager(configuration: configuration)
    }

    /**
     May be overridden by a subclass if you want to control the Content-Type
     that is given to an uploaded form part.

     Return nil to use the default behavior (inferring the Content-Type from
     the file extension).  Return the desired Content-Type otherwise.
     */
    open func contentTypeForFormPart(fileURL: URL) -> String? {
        return nil
    }

    /**
     May be overridden by a subclass if you want to control the request
     configuration (e.g. to override the cache policy).
     */
    open func makeRequest(manager: SessionManager, method: HTTPMethod, encoding: ParameterEncoding, headers: [String:String]) -> DataRequest {
        return manager.request(URLString, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }

    struct CustomEncoding: ParameterEncoding {
        
        func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
            var request = try URLEncoding().encode(urlRequest, with: parameters)
            let data = try Data(contentsOf: parameters!["File"] as! URL)
            request.httpBody = data
            return request
        }
    }

    
    override open func execute(_ completion: @escaping (_ response: Response<T>?, _ error: Error?) -> Void) {
        let managerId:String = UUID().uuidString
        // Create a new manager for each request to customize its request header
        let manager = createSessionManager()
        managerStore[managerId] = manager
        
        let encoding:ParameterEncoding = isBody ? JSONDataEncoding() : URLEncoding()

        let xMethod = Alamofire.HTTPMethod(rawValue: method)
        let fileKeys = parameters == nil ? [] : parameters!.filter { $1 is NSURL }

        if fileKeys.count > 0 {
            
            manager.upload(multipartFormData: { mpForm in
                for (k, v) in self.parameters! {
                    switch v {
                    case let fileURL as URL:
                        if let mimeType = self.contentTypeForFormPart(fileURL: fileURL) {
                            mpForm.append(fileURL, withName: k, fileName: fileURL.lastPathComponent, mimeType: mimeType)
                        }
                        else {
                            mpForm.append(fileURL, withName: k)
                        }
                    case let string as String:
                        mpForm.append(string.data(using: String.Encoding.utf8)!, withName: k)
                    case let number as NSNumber:
                        mpForm.append(number.stringValue.data(using: String.Encoding.utf8)!, withName: k)
                    default:
                        fatalError("Unprocessable value \(v) with key \(k)")
                    }
                }
                }, to: URLString, method: xMethod!, headers: nil, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    if let onProgressReady = self.onProgressReady {
                        onProgressReady(upload.uploadProgress)
                    }
                    self.processRequest(request: upload, managerId, completion)
                case .failure(let encodingError):
                    completion(nil, ErrorResponse.error(415, nil, encodingError))
                }
            })

        } else {
            let request = makeRequest(manager: manager, method: xMethod!, encoding: encoding, headers: headers)
            
            if let onProgressReady = self.onProgressReady {
                onProgressReady(request.progress)
            }
            processRequest(request: request, managerId, completion)
        }

    }

    fileprivate func processRequest(request: DataRequest, _ managerId: String, _ completion: @escaping (_ response: Response<T>?, _ error: Error?) -> Void) {

        let cleanupRequest = {
            _ = managerStore.removeValue(forKey: managerId)
        }

        let validatedRequest = request.validate()

        switch T.self {
        case is String.Type:
            validatedRequest.responseString(completionHandler: { (stringResponse) in
                cleanupRequest()

                if stringResponse.result.isFailure {
                    completion(
                        nil,
                        ErrorResponse.error(stringResponse.response?.statusCode ?? 500, stringResponse.data, stringResponse.result.error as! AFError)
                    )
                    return
                }

                completion(
                    Response(
                        response: stringResponse.response!,
                        body: ((stringResponse.result.value ?? "") as! T)
                    ),
                    nil
                )
            })
        case is URL.Type:
            validatedRequest.responseData(completionHandler: { (dataResponse) in
                cleanupRequest()

                do {

                    guard !dataResponse.result.isFailure else {
                        throw DownloadException.responseFailed
                    }

                    guard let data = dataResponse.data else {
                        throw DownloadException.responseDataMissing
                    }

                    guard let request = request.request else {
                        throw DownloadException.requestMissing
                    }

                    let fileManager = FileManager.default
                    let urlRequest = try request.asURLRequest()
                    let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let requestURL = try self.getURL(from: urlRequest)

                    var requestPath = try self.getPath(from: requestURL)

                    if let headerFileName = self.getFileName(fromContentDisposition: dataResponse.response?.allHeaderFields["Content-Disposition"] as? String) {
                        requestPath = requestPath.appending("/\(headerFileName)")
                    }

                    let filePath = documentsDirectory.appendingPathComponent(requestPath)
                    let directoryPath = filePath.deletingLastPathComponent().path

                    try fileManager.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)
                    try data.write(to: filePath, options: .atomic)

                    completion(
                        Response(
                            response: dataResponse.response!,
                            body: (filePath as! T)
                        ),
                        nil
                    )

                } catch let requestParserError as DownloadException {
                    completion(nil, ErrorResponse.error(400, dataResponse.data, requestParserError))
                } catch let error {
                    completion(nil, ErrorResponse.error(400, dataResponse.data, error))
                }
                return
            })
        case is Void.Type:
            validatedRequest.responseData(completionHandler: { (voidResponse) in
                cleanupRequest()

                if voidResponse.result.isFailure {
                    completion(
                        nil,
                        ErrorResponse.error(voidResponse.response?.statusCode ?? 500, voidResponse.data, voidResponse.result.error!)
                    )
                    return
                }

                completion(
                    Response(
                        response: voidResponse.response!,
                        body: nil),
                    nil
                )
            })
        default:
            validatedRequest.responseData(completionHandler: { (dataResponse) in
                cleanupRequest()

                if dataResponse.result.isFailure {
                    completion(
                        nil,
                        ErrorResponse.error(dataResponse.response?.statusCode ?? 500, dataResponse.data, dataResponse.result.error!)
                    )
                    return
                }

                completion(
                    Response(
                        response: dataResponse.response!,
                        body: (dataResponse.data as! T)
                    ),
                    nil
                )
            })
        }
    }

    open func buildHeaders() -> [String: String] {
        var httpHeaders = SessionManager.defaultHTTPHeaders
        for (key, value) in self.headers {
            httpHeaders[key] = value
        }
        return httpHeaders
    }

    fileprivate func getFileName(fromContentDisposition contentDisposition : String?) -> String? {

        guard let contentDisposition = contentDisposition else {
            return nil
        }

        let items = contentDisposition.components(separatedBy: ";")

        var filename : String? = nil

        for contentItem in items {

            let filenameKey = "filename="
            guard let range = contentItem.range(of: filenameKey) else {
                break
            }

            filename = contentItem
            return filename?
                .replacingCharacters(in: range, with:"")
                .replacingOccurrences(of: "\"", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
        }

        return filename

    }

    fileprivate func getPath(from url : URL) throws -> String {

        guard var path = NSURLComponents(url: url, resolvingAgainstBaseURL: true)?.path else {
            throw DownloadException.requestMissingPath
        }

        if path.hasPrefix("/") {
            path.remove(at: path.startIndex)
        }

        return path

    }

    fileprivate func getURL(from urlRequest : URLRequest) throws -> URL {

        guard let url = urlRequest.url else {
            throw DownloadException.requestMissingURL
        }

        return url
    }

}

fileprivate enum DownloadException : Error {
    case responseDataMissing
    case responseFailed
    case requestMissing
    case requestMissingPath
    case requestMissingURL
}

public enum AlamofireDecodableRequestBuilderError: Error {
    case emptyDataResponse
    case nilHTTPResponse
    case jsonDecoding(DecodingError)
    case generalError(Error)
}

open class AlamofireDecodableRequestBuilder<T:Decodable>: AlamofireRequestBuilder<T> {

    override fileprivate func processRequest(request: DataRequest, _ managerId: String, _ completion: @escaping (_ response: Response<T>?, _ error: Error?) -> Void) {

        let cleanupRequest = {
            _ = managerStore.removeValue(forKey: managerId)
        }

        let validatedRequest = request.validate()

        switch T.self {
        case is String.Type:
            validatedRequest.responseString(completionHandler: { (stringResponse) in
                cleanupRequest()

                if stringResponse.result.isFailure {
                    completion(
                        nil,
                        ErrorResponse.error(stringResponse.response?.statusCode ?? 500, stringResponse.data, stringResponse.result.error!)
                    )
                    return
                }

                completion(
                    Response(
                        response: stringResponse.response!,
                        body: ((stringResponse.result.value ?? "") as! T)
                    ),
                    nil
                )
            })
        case is Void.Type:
            validatedRequest.responseData(completionHandler: { (voidResponse) in
                cleanupRequest()

                if voidResponse.result.isFailure {
                    completion(
                        nil,
                        ErrorResponse.error(voidResponse.response?.statusCode ?? 500, voidResponse.data, voidResponse.result.error!)
                    )
                    return
                }

                completion(
                    Response(
                        response: voidResponse.response!,
                        body: nil),
                    nil
                )
            })
        case is Data.Type:
            validatedRequest.responseData(completionHandler: { (dataResponse) in
                cleanupRequest()

                if dataResponse.result.isFailure {
                    completion(
                        nil,
                        ErrorResponse.error(dataResponse.response?.statusCode ?? 500, dataResponse.data, dataResponse.result.error!)
                    )
                    return
                }

                completion(
                    Response(
                        response: dataResponse.response!,
                        body: (dataResponse.data as! T)
                    ),
                    nil
                )
            })
        default:
            validatedRequest.responseData(completionHandler: { (dataResponse: DataResponse<Data>) in
                cleanupRequest()

                guard dataResponse.result.isSuccess else {
                    completion(nil, ErrorResponse.error(dataResponse.response?.statusCode ?? 500, dataResponse.data, dataResponse.result.error!))
                    return
                }

                guard let data = dataResponse.data, !data.isEmpty else {
                    completion(nil, ErrorResponse.error(-1, nil, AlamofireDecodableRequestBuilderError.emptyDataResponse))
                    return
                }

                guard let httpResponse = dataResponse.response else {
                    completion(nil, ErrorResponse.error(-2, nil, AlamofireDecodableRequestBuilderError.nilHTTPResponse))
                    return
                }

                var responseObj: Response<T>? = nil

                if ClientAPI.debugging {
                    print("Respond body")
                    print(String(data: dataResponse.data!, encoding: .utf8)!)
                }
                
                let decodeResult: (decodableObj: T?, error: Error?) = CodableHelper.decode(T.self, from: data)
                if decodeResult.error == nil {
                    responseObj = Response(response: httpResponse, body: decodeResult.decodableObj)
                }

                completion(responseObj, decodeResult.error)
            })
        }
    }

}
