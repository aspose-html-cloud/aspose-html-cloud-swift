/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="APIs.swift">
 *  Copyright (c) 2020 Aspose.HTML for Cloud
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

open class ClientAPI {
    public static var basePath = ""
    private static var authPath = ""
    private static var apiKey = ""
    private static var appSID = ""
    public static var debugging = false
    private static var token = ""
    public static var customHeaders: [String:String] = [:]
    public static var requestBuilderFactory: RequestBuilderFactory = AlamofireRequestBuilderFactory()
    
    public static func setConfig(basePath: String, authPath: String,
                               apiKey: String, appSID: String, debugging: Bool = false){
        ClientAPI.basePath = basePath
        ClientAPI.authPath = authPath
        ClientAPI.apiKey = apiKey
        ClientAPI.appSID = appSID
        ClientAPI.debugging = debugging
        getToken()
    }
    
    private static func getToken(){
        let url = URL(string: ClientAPI.authPath)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let postString = "grant_type=client_credentials&client_id="+ClientAPI.appSID+"&client_secret="+ClientAPI.apiKey
        request.httpBody = postString.data(using: .utf8)
        
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
     
            guard let js = try? JSONDecoder().decode(AuthResponse.self, from: dataStr!) else {
                print("Falied decode json.")
                return
            }
            
            ClientAPI.customHeaders["Authorization"] = "Bearer " + js.accessToken
            
            // Add identity headers to SDK
            ClientAPI.customHeaders["x-aspose-client"] = "aspose.html-cloud swift sdk"
            ClientAPI.customHeaders["x-aspose-client-version"] = "22.10.2"

            ds.signal()
        })
        task.resume()
        
        // block thread until semaphore is signaled
        ds.wait()
    }
}

open class RequestBuilder<T> {
    var headers: [String:String]
    let parameters: [String:Any]?
    let isBody: Bool
    let method: String
    let URLString: String

    /// Optional block to obtain a reference to the request's progress instance when available.
    public var onProgressReady: ((Progress) -> ())?

    required public init(method: String, URLString: String, parameters: [String:Any]?, isBody: Bool, headers: [String:String] = [:]) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.isBody = isBody
        self.headers = headers

        addHeaders(ClientAPI.customHeaders)
    }

    open func addHeaders(_ aHeaders:[String:String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }

    open func execute(_ completion: @escaping (_ response: Response<T>?, _ error: Error?) -> Void) { }

    public func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
        }
        return self
    }
 }

public protocol RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type
    func getBuilder<T:Decodable>() -> RequestBuilder<T>.Type
}
