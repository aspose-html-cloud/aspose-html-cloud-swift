/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="HtmlAPI.swift">
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


open class HtmlAPI {

    /**
     Converts a document located on a local disk to a local disk.

     - parameter src: (String) Full path to the source file on a local disk.
     - parameter dst: (String) Full path to the result file on a local disk.
     - parameter options: (Options?) Options for conversion.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convertLocalToLocal(src: String, dst: String, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        convert(src: src, dst: dst, srcInLocal: true, dstInLocal: true, isUrl: false, options: options, storage: nil) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Converts a document located on a local disk to a user's storage.

     - parameter src: (String) Full path to the source file on a local disk.
     - parameter dst: (String) Full path to the result file on a storage.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for conversion.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convertLocalToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        convert(src: src, dst: dst, srcInLocal: true, dstInLocal: false, isUrl: false, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Converts a document located on a user's storage to a local disk.

     - parameter src: (String) Full path to the source file on a user's storage.
     - parameter dst: (String) Full path to the result file on a local disk.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for conversion.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convertStorageToLocal(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        convert(src: src, dst: dst, srcInLocal: false, dstInLocal: true, isUrl: false, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Converts a document located on a user's storage to a user's storage.

     - parameter src: (String) Full path to the source file on a storage.
     - parameter dst: (String) Full path to the result file on a storage.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for conversion.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convertStorageToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        convert(src: src, dst: dst, srcInLocal: false, dstInLocal: false, isUrl: false, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Converts the website by URL to a local file.

     - parameter src: (String) Web address.
     - parameter dst: (String) Full path to the result file on a local disk.
     - parameter options: (Options?) Options for conversion.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convertUrlToLocal(src: String, dst: String, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        convert(src: src, dst: dst, srcInLocal: false, dstInLocal: true, isUrl: true, options: options) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Converts the website by URL to a user's storage.

     - parameter src: (String) Web address.
     - parameter dst: (String) Full path to the result file on a storage.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for conversion.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convertUrlToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        convert(src: src, dst: dst, srcInLocal: false, dstInLocal: false, isUrl: true, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Vectorize an image located on a local disk to a local disk.

     - parameter src: (String) Full path to the source file on a local disk.
     - parameter dst: (String) Full path to the result file on a local disk.
     - parameter options: (Options?) Options for vectorization.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func vectorizeLocalToLocal(src: String, dst: String, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        vectorize(src: src, dst: dst, srcInLocal: true, dstInLocal: true, options: options, storage: nil) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Vectorize an image located on a local disk to a user's storage.

     - parameter src: (String) Full path to the source file on a local disk.
     - parameter dst: (String) Full path to the result file on a storage.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for vectorization.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func vectorizeLocalToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        vectorize(src: src, dst: dst, srcInLocal: true, dstInLocal: false, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Vectorize an image located on a user's storage to a local disk.

     - parameter src: (String) Full path to the source file on a user's storage.
     - parameter dst: (String) Full path to the result file on a local disk.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for vectorization.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func vectorizeStorageToLocal(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        vectorize(src: src, dst: dst, srcInLocal: false, dstInLocal: true, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     Vectorize an image located on a user's storage to a user's storage.

     - parameter src: (String) Full path to the source file on a storage.
     - parameter dst: (String) Full path to the result file on a storage.
     - parameter storage: (String?) User's storage. (optional)
     - parameter options: (Options?) Options for vectorization.
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func vectorizeStorageToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        vectorize(src: src, dst: dst, srcInLocal: false, dstInLocal: false, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }

    /**
     General function for vectorization.

     - parameter src: (String) Source data.
     - parameter dst: (String) Full path to the result file.
     - parameter srcInLocal: (Bool) Source file on a local disk.
     - parameter dstInLocal: (Bool) Save result to a local disk.
     - parameter options: (Options?) Options for vectorization.
     - parameter storage: (String?) User's storage. (optional)
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func vectorize(
        src: String,
        dst: String,
        srcInLocal: Bool,
        dstInLocal: Bool,
        options: Options?,
        storage: String? = nil,
        completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        let formats = ["jpg", "jpeg", "tif", "tiff", "png", "bmp", "gif"]
        
        let inputFormat = URL(string: src)!.pathExtension.lowercased()
        
        guard formats.contains(inputFormat) else {
            print("error=Input format must be an image")
            completion(nil, nil)
            return
        }

        let outputFormat = URL(string: dst)!.pathExtension.lowercased()
        
        guard outputFormat == "svg" else {
            print("error=Output format must be SVG")
            completion(nil, nil)
            return
        }
        
        convert(src: src, dst: dst, srcInLocal: srcInLocal, dstInLocal: dstInLocal, isUrl: false, options: options, storage: storage) {(response, error) -> Void in
        completion(response, error)
        }
    }
    
    /**
     General function for conversion.

     - parameter src: (String) Source data.
     - parameter dst: (String) Full path to the result file.
     - parameter srcInLocal: (Bool) Source file on a local disk.
     - parameter dstInLocal: (Bool) Save result to a local disk.
     - parameter isUrl: (Bool) Source is URL.
     - parameter options: (Options?) Options for conversion.
     - parameter options.width: (Float32?) Resulting width in pixels for images and in inches for PDF, XPS, DOCX formats. (optional)
     - parameter options.height: (Float32?) Resulting height in pixels for images and in inches for PDF, XPS, DOCX formats. (optional)
     - parameter options.leftMargin: (Float32?) Left margin in pixels for images and in inches for PDF, XPS, DOCX formats. (optional)
     - parameter options.rightMargin: (Float32?) Right margin in pixels for images and in inches for PDF, XPS, DOCX formats. (optional)
     - parameter options.topMargin: (Float32?) Top margin in pixels for images and in inches for PDF, XPS, DOCX formats. (optional)
     - parameter options.bottomMargin: (Float32?) Bottom margin in pixels for images and in inches for PDF, XPS, DOCX formats. (optional)
     - parameter storage: (String?) User's storage. (optional)
     - parameter completion: Completion handler to receive the data (OperationResult?) and the error(Error?) objects
     */
    open class func convert(
            src: String,
            dst: String,
            srcInLocal: Bool,
            dstInLocal: Bool,
            isUrl: Bool,
            options: Options?,
            storage: String? = nil,
            completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {

        var outFile = URL(string: dst)!.lastPathComponent

        if !dstInLocal {
            outFile = dst
        }

        var inputFormat = "html"

        if !isUrl {
            let ext = URL(string: src)!.pathExtension.lowercased()
            switch ext {
            case "jpg":
                inputFormat = "jpeg"
            case "tif":
                inputFormat = "tiff"
            case "htm":
                inputFormat = "html"
            case "mht":
                inputFormat = "mhtml"
            default:
                inputFormat = ext
            }
        }

        var outputFormat = URL(string: dst)!.pathExtension.lowercased()

        if outputFormat == "jpg" {
            outputFormat = "jpeg"
        } else if outputFormat == "mht" {
            outputFormat = "mhtml";
        } else if outputFormat == "tif" {
            outputFormat = "tiff";
        }

        var path = "/html/conversion/{from}-{to}"
        path = path.replacingOccurrences(of: "{from}", with: "\(inputFormat)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{to}", with: "\(outputFormat)", options: .literal, range: nil)

        if srcInLocal {
            let url = URL(string: src)!
            
            StorageAPI.uploadFile(file: url, path: "/", storageName: nil) {(data, error) in

                guard error == nil else {
                    print("Error uploadFile. Error=\(error!.localizedDescription)")
                    completion(nil, error)
                    return
                }

                let reqBody = JobRequest(inputPath: data!.uploaded![0], outputFile: outFile, options: options, storageName: storage, resources: nil)
                let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: reqBody)

                createConversion(path: path, parameters: parameters!, dstInLocal: dstInLocal, dst: dst, storage: storage, completion: completion)
            }
        } else {
            let reqBody = JobRequest(inputPath: src, outputFile: outFile, options: options, storageName: storage, resources: nil)
            let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: reqBody)

            createConversion(path: path, parameters: parameters!, dstInLocal: dstInLocal, dst: dst, storage: storage, completion: completion)
        }
    }

    private static func createConversion(path: String, parameters: [String:Any], dstInLocal: Bool, dst: String, storage: String?, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void)) {
        let URLString = ClientAPI.basePath + path
        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<OperationResult>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        let req = requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)

        req.execute {
            (resp, err) -> Void in

            guard let resp = resp, err == nil else {
                print("error=\(String(describing: err))")
                completion(nil, err)
                return
            }

            let id = resp.body!.id

            var answer = OperationResult()

            while(true){

                answer = checkStatus(id: id)

                guard answer.status != "faulted" || answer.status != "canceled" else {
                    print("Error status of conversion")
                    completion(answer, nil)
                    return
                }
                if answer.status == "completed" {
                    break
                }
                usleep(3000000)
            }

            if dstInLocal {
                StorageAPI.downloadFile(path: answer.file!, storageName: storage, versionId: nil) {(data, error) in
                    guard error == nil else {
                        print("Error download file. Error=\(error!.localizedDescription)")
                        completion(nil, error)
                        return
                    }

                    let url = URL(string: answer.file!)
                    let fileName = url!.lastPathComponent
                    let dirName = URL(string: dst)!.deletingLastPathComponent()
                    let target = dirName.appendingPathComponent(fileName)

                    answer.file = target.path
                    do{
                        _ = try data!.write(to: target)
                        completion(answer, nil)
                    }catch{
                        print("Error save file.\(error)")
                        completion(nil, error)
                    }
                }
            } else {
                completion(answer, nil)
            }
        }
    }

    private static func checkStatus(id: String) -> OperationResult {

        var result = OperationResult();

        var path = "/html/conversion/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let url = URL(string: URLString)

        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(ClientAPI.customHeaders["Authorization"], forHTTPHeaderField: "Authorization")
        request.setValue(ClientAPI.customHeaders["x-aspose-client"], forHTTPHeaderField: "x-aspose-client")
        request.setValue(ClientAPI.customHeaders["x-aspose-client-version"], forHTTPHeaderField: "x-aspose-client-version")

        let session = URLSession.shared
        
        //For sync request
        let ds = DispatchSemaphore( value: 0 )
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Status code should be 200, but is \(httpStatus.statusCode)")
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            if ClientAPI.debugging {
                print("responseString = \(String(describing: responseString))")
            }
            
            let dataStr = responseString?.data(using: .utf8, allowLossyConversion: false)
     
            guard let js = try? JSONDecoder().decode(OperationResult.self, from: dataStr!) else {
                print("Falied decode json.")
                return
            }

            result = js
            ds.signal()
        })
        task.resume()
        
        // block thread until semaphore is signaled
        ds.wait()
        return result
    }
}
