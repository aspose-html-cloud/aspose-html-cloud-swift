/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="HtmlAPI.swift">
 *  Copyright (c) 2019 Aspose.HTML for Cloud
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
     Converts the HTML document (located on storage) to the specified image format and returns resulting file in response content.
     
     - parameter name: (path) Document name.
     - parameter outFormat: (path) Resulting image format. 
     - parameter width: (query) Resulting image width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting image height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting image margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting image margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting image margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting image margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getConvertDocumentToImage(name: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getConvertDocumentToImageWithRequestBuilder(name: name, outFormat: outFormat, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, resolution: resolution, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to the specified image format and returns resulting file in response content.
     - GET /html/{name}/convert/image/{outFormat}
     - examples: [{output=none}]
     
     - parameter name: (path) Document name. 
     - parameter outFormat: (path) Resulting image format. 
     - parameter width: (query) Resulting image width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting image height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting image margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting image margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting image margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting image margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getConvertDocumentToImageWithRequestBuilder(name: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/image/{outFormat}"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "resolution": resolution?.encodeToJSON(), 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML page (located in the Web) to the specified image format and returns resulting file in response content.
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter outFormat: (path) Resulting image format. 
     - parameter width: (query) Resulting image width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting image height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting image margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting image margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting image margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting image margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getConvertDocumentToImageByUrl(sourceUrl: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getConvertDocumentToImageByUrlWithRequestBuilder(sourceUrl: sourceUrl, outFormat: outFormat, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, resolution: resolution).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML page (located in the Web) to the specified image format and returns resulting file in response content.
     - GET /html/convert/image/{outFormat}
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter outFormat: (path) Resulting image format. 
     - parameter width: (query) Resulting image width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting image height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting image margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting image margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting image margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting image margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getConvertDocumentToImageByUrlWithRequestBuilder(sourceUrl: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil) -> RequestBuilder<Data> {
        var path = "/html/convert/image/{outFormat}"
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "resolution": resolution?.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to PDF and returns resulting file in response content.
     
     - parameter name: (path) Document name. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getConvertDocumentToPdf(name: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getConvertDocumentToPdfWithRequestBuilder(name: name, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to PDF and returns resulting file in response content.
     - GET /html/{name}/convert/pdf
     - examples: [{output=none}]
     
     - parameter name: (path) Document name. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getConvertDocumentToPdfWithRequestBuilder(name: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/pdf"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Convert the HTML page (located in the Web) to PDF and returns resulting file in response content.
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getConvertDocumentToPdfByUrl(sourceUrl: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getConvertDocumentToPdfByUrlWithRequestBuilder(sourceUrl: sourceUrl, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Convert the HTML page (located in the Web) to PDF and returns resulting file in response content.
     - GET /html/convert/pdf
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getConvertDocumentToPdfByUrlWithRequestBuilder(sourceUrl: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil) -> RequestBuilder<Data> {
        let path = "/html/convert/pdf"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to XPS and returns resulting file in response content.
     
     - parameter name: (path) Document name. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getConvertDocumentToXps(name: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getConvertDocumentToXpsWithRequestBuilder(name: name, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to XPS and returns resulting file in response content.
     - GET /html/{name}/convert/xps
     - examples: [{output=none}]
     
     - parameter name: (path) Document name. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getConvertDocumentToXpsWithRequestBuilder(name: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/xps"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML page (located in the Web) to XPS and returns resulting file in response content.
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getConvertDocumentToXpsByUrl(sourceUrl: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getConvertDocumentToXpsByUrlWithRequestBuilder(sourceUrl: sourceUrl, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML page (located in the Web) to XPS and returns resulting file in response content.
     - GET /html/convert/xps
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getConvertDocumentToXpsByUrlWithRequestBuilder(sourceUrl: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil) -> RequestBuilder<Data> {
        let path = "/html/convert/xps"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (in request content) to the specified image format and uploads resulting file to storage.
     
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.jpg) 
     - parameter outFormat: (path)  
     - parameter file: (form) A file to be converted. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postConvertDocumentInRequestToImage(outPath: String, outFormat: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        postConvertDocumentInRequestToImageWithRequestBuilder(outPath: outPath, outFormat: outFormat, file: file, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, resolution: resolution).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (in request content) to the specified image format and uploads resulting file to storage.
     - POST /html/convert/image/{outFormat}
     - examples: [{contentType=application/json, example=""}]
     
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.jpg) 
     - parameter outFormat: (path)  
     - parameter file: (form) A file to be converted. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func postConvertDocumentInRequestToImageWithRequestBuilder(outPath: String, outFormat: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil) -> RequestBuilder<Data> {
        var path = "/html/convert/image/{outFormat}"
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "resolution": resolution?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (in request content) to PDF and uploads resulting file to storage.
     
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.pdf) 
     - parameter file: (form) A file to be converted. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postConvertDocumentInRequestToPdf(outPath: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        postConvertDocumentInRequestToPdfWithRequestBuilder(outPath: outPath, file: file, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (in request content) to PDF and uploads resulting file to storage.
     - POST /html/convert/pdf
     - examples: [{contentType=application/json, example=""}]
     
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.pdf) 
     - parameter file: (form) A file to be converted. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)

     - returns: RequestBuilder<Data>
     */
    open class func postConvertDocumentInRequestToPdfWithRequestBuilder(outPath: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil) -> RequestBuilder<Data> {
        let path = "/html/convert/pdf"
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (in request content) to XPS and uploads resulting file to storage.
     
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.xps) 
     - parameter file: (form) A file to be converted. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postConvertDocumentInRequestToXps(outPath: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        postConvertDocumentInRequestToXpsWithRequestBuilder(outPath: outPath, file: file, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (in request content) to XPS and uploads resulting file to storage.
     - POST /html/convert/xps
     - examples: [{contentType=application/json, example=""}]
     
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.xps) 
     - parameter file: (form) A file to be converted. 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)

     - returns: RequestBuilder<Data>
     */
    open class func postConvertDocumentInRequestToXpsWithRequestBuilder(outPath: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil) -> RequestBuilder<Data> {
        let path = "/html/convert/xps"
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to the specified image format and uploads resulting file to storage.
     
     - parameter name: (path) Document name. 
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.jpg) 
     - parameter outFormat: (path)  
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func putConvertDocumentToImage(name: String, outPath: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        putConvertDocumentToImageWithRequestBuilder(name: name, outPath: outPath, outFormat: outFormat, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, resolution: resolution, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to the specified image format and uploads resulting file to storage.
     - PUT /html/{name}/convert/image/{outFormat}
     - examples: [{contentType=application/json, example=""}]
     
     - parameter name: (path) Document name. 
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.jpg) 
     - parameter outFormat: (path)  
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter resolution: (query) Resolution of resulting image. Default is 96 dpi. (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func putConvertDocumentToImageWithRequestBuilder(name: String, outPath: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/image/{outFormat}"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "resolution": resolution?.encodeToJSON(), 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to PDF and uploads resulting file to storage.
     
     - parameter name: (path) Document name. 
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.pdf) 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func putConvertDocumentToPdf(name: String, outPath: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        putConvertDocumentToPdfWithRequestBuilder(name: name, outPath: outPath, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to PDF and uploads resulting file to storage.
     - PUT /html/{name}/convert/pdf
     - examples: [{contentType=application/json, example=""}]
     
     - parameter name: (path) Document name. 
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.pdf) 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func putConvertDocumentToPdfWithRequestBuilder(name: String, outPath: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/pdf"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to XPS and uploads resulting file to storage.
     
     - parameter name: (path) Document name. 
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.xps) 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func putConvertDocumentToXps(name: String, outPath: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        putConvertDocumentToXpsWithRequestBuilder(name: name, outPath: outPath, width: width, height: height, leftMargin: leftMargin, rightMargin: rightMargin, topMargin: topMargin, bottomMargin: bottomMargin, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to XPS and uploads resulting file to storage.
     - PUT /html/{name}/convert/xps
     - examples: [{contentType=application/json, example=""}]
     
     - parameter name: (path) Document name. 
     - parameter outPath: (query) Full resulting filename (ex. /folder1/folder2/result.xps) 
     - parameter width: (query) Resulting document page width in points (1/96 inch). (optional)
     - parameter height: (query) Resulting document page height in points (1/96 inch). (optional)
     - parameter leftMargin: (query) Left resulting document page margin in points (1/96 inch). (optional)
     - parameter rightMargin: (query) Right resulting document page margin in points (1/96 inch). (optional)
     - parameter topMargin: (query) Top resulting document page margin in points (1/96 inch). (optional)
     - parameter bottomMargin: (query) Bottom resulting document page margin in points (1/96 inch). (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func putConvertDocumentToXpsWithRequestBuilder(name: String, outPath: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/xps"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "width": width?.encodeToJSON(), 
            "height": height?.encodeToJSON(), 
            "leftMargin": leftMargin?.encodeToJSON(), 
            "rightMargin": rightMargin?.encodeToJSON(), 
            "topMargin": topMargin?.encodeToJSON(), 
            "bottomMargin": bottomMargin?.encodeToJSON(), 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML page from Web by its URL to MHTML returns resulting file in response content.

     - parameter sourceUrl: (query) Source page URL.
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getConvertDocumentToMHTMLByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        getConvertDocumentToMHTMLByUrlWithRequestBuilder(sourceUrl: sourceUrl).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML page from Web by its URL to MHTML returns resulting file in response content.
     - GET /html/convert/mhtml
     - examples: [{output=none}]

     - parameter sourceUrl: (query) Source page URL.

     - returns: RequestBuilder<Data>
     */
    public class func getConvertDocumentToMHTMLByUrlWithRequestBuilder( sourceUrl: String) -> RequestBuilder<Data> {
        let path = "/html/convert/mhtml"
        let URLString = ClientAPI.basePath + path

		let parameters: [String:Any]? = nil
        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl
        ])
        
        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to Markdown and returns resulting file in response content.

     - parameter name: (path) Document name.
     - parameter useGit: (query) Use Git Markdown flavor to save. (optional, default to "false")
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getConvertDocumentToMarkdown(name: String, useGit: String? = "false", folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        getConvertDocumentToMarkdownWithRequestBuilder(name: name, useGit: useGit, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to Markdown and returns resulting file in response content.
     - GET /html/{name}/convert/md
     - examples: [{output=none}]

     - parameter name: (path) Document name.
     - parameter useGit: (query) Use Git Markdown flavor to save. (optional, default to "false")
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    public class func getConvertDocumentToMarkdownWithRequestBuilder( name: String, useGit: String? = "false", folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/md"
        path = path.replacingOccurrences(of:"{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "useGit": useGit,
            "folder": folder,
            "storage": storage
            ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (in request content) to Markdown and uploads resulting file to storage by specified path.

     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.md)
     - parameter file: (form) A file to be converted.
     - parameter useGit: (query) Use Git Markdown flavor to save. (optional, default to false)
     - parameter storage: (query) Document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func postConvertDocumentInRequestToMarkdown(outPath: String, file: URL, useGit: String? = "false", storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        postConvertDocumentInRequestToMarkdownWithRequestBuilder(outPath: outPath, file: file, useGit: useGit, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (in request content) to Markdown and uploads resulting file to storage by specified path.
     - POST /html/convert/md
     - examples: [{contentType=application/json, example=""}]

     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.md)
     - parameter file: (form) A file to be converted.
     - parameter useGit: (query) Use Git Markdown flavor to save. (optional, default to false)
     - parameter storage: (query) Document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    public class func postConvertDocumentInRequestToMarkdownWithRequestBuilder(outPath: String, file: URL, useGit: String? = "false", storage: String? = nil) -> RequestBuilder<Data> {
        let path = "/html/convert/md"
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath,
            "useGit": useGit,
			"storage": storage
			])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the HTML document (located on storage) to Markdown and uploads resulting file to storage by specified path.

     - parameter name: (path) Document name.
     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.md)
     - parameter useGit: (query) Use Git Markdown flavor to save. (optional, default to false)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func putConvertDocumentToMarkdown(name: String, outPath: String, useGit: String? = "false", folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        putConvertDocumentToMarkdownWithRequestBuilder(name: name, outPath: outPath, useGit: useGit, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the HTML document (located on storage) to Markdown and uploads resulting file to storage by specified path.
     - PUT /html/{name}/convert/md
     - examples: [{contentType=application/json, example=""}]

     - parameter name: (path) Document name.
     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.md)
     - parameter useGit: (query) Use Git Markdown flavor to save. (optional, default to false)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    public class func putConvertDocumentToMarkdownWithRequestBuilder(name: String, outPath: String, useGit: String? = "false", folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/convert/md"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path

        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath,
            "uswGit": useGit,
            "folder": folder,
            "storage": storage
            ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the Markdown document (located on storage) to HTML and returns resulting file in response content.

     - parameter name: (path) Document name.
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getConvertMarkdownToHtml(name: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        getConvertMarkdownToHtmlWithRequestBuilder(name: name, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the Markdown document (located on storage) to HTML and returns resulting file in response content.
     - GET /html/{name}/import/md
     - examples: [{output=none}]

     - parameter name: (path) Document name.
     - parameter folder: (query) Source document folder. (optional)
     - parameter storage: (query) Source document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    public class func getConvertMarkdownToHtmlWithRequestBuilder( name: String, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/import/md"
        path = path.replacingOccurrences(of:"{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "folder": folder,
            "storage": storage
            ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the Markdown document (in request content) to HTML and uploads resulting file to storage by specified path.

     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.html)
     - parameter file: (form) A file to be converted.
     - parameter storage: (query) Document storage. (optional)

     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func postConvertMarkdownInRequestToHtml(outPath: String, file: URL, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        postConvertMarkdownInRequestToHtmlWithRequestBuilder(outPath: outPath, file: file, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the Markdown document (in request content) to HTML and uploads resulting file to storage by specified path.
     - POST /html/import/md
     - examples: [{contentType=application/json, example=""}]

     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.html)
     - parameter file: (form) A file to be converted.
     - parameter storage: (query) Document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    public class func postConvertMarkdownInRequestToHtmlWithRequestBuilder(outPath: String, file: URL, storage: String? = nil) -> RequestBuilder<Data> {
        let path = "/html/import/md"
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath,
            "storage": storage
			])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts the Markdown document (located on storage) to HTML and uploads resulting file to storage by specified path.

     - parameter name: (path) Document name.
     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.html)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func putConvertMarkdownToHtml(name: String, outPath: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        putConvertMarkdownToHtmlWithRequestBuilder(name: name, outPath: outPath, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Converts the Markdown document (located on storage) to HTML and uploads resulting file to storage by specified path.
     - PUT /html/{name}/import/md
     - examples: [{contentType=application/json, example=""}]

     - parameter name: (path) Document name.
     - parameter outPath: (query) Full resulting file path in the storage (ex. /folder1/folder2/result.html)
     - parameter folder: (query) The source document folder. (optional)
     - parameter storage: (query) The source and resulting document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    public class func putConvertMarkdownToHtmlWithRequestBuilder(name: String, outPath: String, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/import/md"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path

        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath,
            "folder": folder,
            "storage": storage
            ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Return all HTML page with linked resources packaged as a ZIP archive by the source page URL.

     - parameter sourceUrl: (query) Source page URL.
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getDocumentByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        getDocumentByUrlWithRequestBuilder(sourceUrl: sourceUrl).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return all HTML page with linked resources packaged as a ZIP archive by the source page URL.

     - parameter sourceUrl: (query) Source page URL.
     - returns: RequestBuilder<Data>
     */
    public class func getDocumentByUrlWithRequestBuilder(sourceUrl: String) -> RequestBuilder<Data> {
        let path = "/html/download"
        let URLString = ClientAPI.basePath + path

		let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Return list of HTML fragments matching the specified XPath query. 
     
     - parameter name: (path) The document name. 
     - parameter xPath: (query) XPath query string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 
     - parameter storage: (query) The document storage. (optional)
     - parameter folder: (query) The document folder. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocumentFragmentByXPath(name: String, xPath: String, outFormat: String, storage: String? = nil, folder: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDocumentFragmentByXPathWithRequestBuilder(name: name, xPath: xPath, outFormat: outFormat, storage: storage, folder: folder).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return list of HTML fragments matching the specified XPath query. 
     - GET /html/{name}/fragments/{outFormat}
     - examples: [{output=none}]
     
     - parameter name: (path) The document name. 
     - parameter xPath: (query) XPath query string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 
     - parameter storage: (query) The document storage. (optional)
     - parameter folder: (query) The document folder. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getDocumentFragmentByXPathWithRequestBuilder(name: String, xPath: String, outFormat: String, storage: String? = nil, folder: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/fragments/{outFormat}"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "xPath": xPath, 
            "storage": storage, 
            "folder": folder
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    /**
     Return list of HTML fragments matching the specified XPath query by the source page URL.
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter xPath: (query) XPath query string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocumentFragmentByXPathByUrl(sourceUrl: String, xPath: String, outFormat: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDocumentFragmentByXPathByUrlWithRequestBuilder(sourceUrl: sourceUrl, xPath: xPath, outFormat: outFormat).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return list of HTML fragments matching the specified XPath query by the source page URL.
     - GET /html/fragments/{outFormat}
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter xPath: (query) XPath query string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 

     - returns: RequestBuilder<Data> 
     */
    open class func getDocumentFragmentByXPathByUrlWithRequestBuilder(sourceUrl: String, xPath: String, outFormat: String) -> RequestBuilder<Data> {
        var path = "/html/fragments/{outFormat}"
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl, 
            "xPath": xPath
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Return list of HTML fragments matching the specified CSS selector.
     
     - parameter name: (path) The document name. 
     - parameter selector: (query) CSS selector string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 
     - parameter folder: (query) The document folder. (optional)
     - parameter storage: (query) The document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocumentFragmentsByCSSSelector(name: String, selector: String, outFormat: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDocumentFragmentsByCSSSelectorWithRequestBuilder(name: name, selector: selector, outFormat: outFormat, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return list of HTML fragments matching the specified CSS selector.
     - GET /html/{name}/fragments/css/{outFormat}
     - examples: [{output=none}]
     
     - parameter name: (path) The document name. 
     - parameter selector: (query) CSS selector string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 
     - parameter folder: (query) The document folder. (optional)
     - parameter storage: (query) The document storage. (optional)

     - returns: RequestBuilder<URL> 
     */
    open class func getDocumentFragmentsByCSSSelectorWithRequestBuilder(name: String, selector: String, outFormat: String, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/fragments/css/{outFormat}"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "selector": selector, 
            "folder": folder, 
            "storage": storage
        ])
        

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Return list of HTML fragments matching the specified CSS selector by the source page URL.
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter selector: (query) CSS selector string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocumentFragmentsByCSSSelectorByUrl(sourceUrl: String, selector: String, outFormat: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDocumentFragmentsByCSSSelectorByUrlWithRequestBuilder(sourceUrl: sourceUrl, selector: selector, outFormat: outFormat).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return list of HTML fragments matching the specified CSS selector by the source page URL.
     - GET /html/fragments/css/{outFormat}
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter selector: (query) CSS selector string. 
     - parameter outFormat: (path) Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. 

     - returns: RequestBuilder<URL> 
     */
    open class func getDocumentFragmentsByCSSSelectorByUrlWithRequestBuilder(sourceUrl: String, selector: String, outFormat: String) -> RequestBuilder<Data> {
        var path = "/html/fragments/css/{outFormat}"
        path = path.replacingOccurrences(of: "{outFormat}", with: "\(outFormat)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl, 
            "selector": selector
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    /**
     Return all HTML document images packaged as a ZIP archive.
     
     - parameter name: (path) The document name. 
     - parameter folder: (query) The document folder. (optional)
     - parameter storage: (query) The document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocumentImages(name: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDocumentImagesWithRequestBuilder(name: name, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return all HTML document images packaged as a ZIP archive.
     - GET /html/{name}/images/all
     - examples: [{output=none}]
     
     - parameter name: (path) The document name. 
     - parameter folder: (query) The document folder. (optional)
     - parameter storage: (query) The document storage. (optional)

     - returns: RequestBuilder<Data>
    */
    open class func getDocumentImagesWithRequestBuilder(name: String, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/images/all"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "folder": folder, 
            "storage": storage
        ])
        

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    /**
     Return all HTML page images packaged as a ZIP archive by the source page URL.
     
     - parameter sourceUrl: (query) Source page URL. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocumentImagesByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDocumentImagesByUrlWithRequestBuilder(sourceUrl: sourceUrl).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Return all HTML page images packaged as a ZIP archive by the source page URL.
     - GET /html/images/all
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source page URL. 

     - returns: RequestBuilder<Data> 
     */
    open class func getDocumentImagesByUrlWithRequestBuilder(sourceUrl: String) -> RequestBuilder<Data> {
        let path = "/html/images/all"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Recognize text from the image file in the storage and import it to HTML format.
     
     - parameter name: (path) The image file name. 
     - parameter ocrEngineLang: (query) OCR engine language - language  (optional, default to en)
     - parameter folder: (query) The source image folder. (optional)
     - parameter storage: (query) The source image storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getRecognizeAndImportToHtml(name: String, ocrEngineLang: String? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getRecognizeAndImportToHtmlWithRequestBuilder(name: name, ocrEngineLang: ocrEngineLang, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Recognize text from the image file in the storage and import it to HTML format.
     - GET /html/{name}/ocr/import
     - examples: [{output=none}]
     
     - parameter name: (path) The image file name. 
     - parameter ocrEngineLang: (query) OCR engine language - language  (optional, default to en)
     - parameter folder: (query) The source image folder. (optional)
     - parameter storage: (query) The source image storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getRecognizeAndImportToHtmlWithRequestBuilder(name: String, ocrEngineLang: String? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/ocr/import"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "ocrEngineLang": ocrEngineLang, 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Recognize text from the image file in the storage, import it to HTML format and translate to specified language.
     
     - parameter name: (path) The image file name. 
     - parameter srcLang: (path) Source language - also supposed as the OCR engine language. 
     - parameter resLang: (path) Result language. 
     - parameter folder: (query) The source image folder. (optional)
     - parameter storage: (query) The source image storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getRecognizeAndTranslateToHtml(name: String, srcLang: String, resLang: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getRecognizeAndTranslateToHtmlWithRequestBuilder(name: name, srcLang: srcLang, resLang: resLang, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Recognize text from the image file in the storage, import it to HTML format and translate to specified language.
     - GET /html/{name}/ocr/translate/{srcLang}/{resLang}
     - examples: [{output=none}]
     
     - parameter name: (path) The image file name. 
     - parameter srcLang: (path) Source language - also supposed as the OCR engine language. 
     - parameter resLang: (path) Result language. 
     - parameter folder: (query) The source image folder. (optional)
     - parameter storage: (query) The source image storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getRecognizeAndTranslateToHtmlWithRequestBuilder(name: String, srcLang: String, resLang: String, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/ocr/translate/{srcLang}/{resLang}"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{srcLang}", with: "\(srcLang)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{resLang}", with: "\(resLang)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get the HTML document keywords using the keyword detection service.
     
     - parameter name: (path) Document name. 
     - parameter folder: (query) Document folder. (optional)
     - parameter storage: (query) Document storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDetectHtmlKeywords(name: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDetectHtmlKeywordsWithRequestBuilder(name: name, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Get the HTML document keywords using the keyword detection service.
     - GET /html/{name}/summ/keywords
     - examples: [{contentType=application/json, example=""}]
     
     - parameter name: (path) Document name. 
     - parameter folder: (query) Document folder. (optional)
     - parameter storage: (query) Document storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getDetectHtmlKeywordsWithRequestBuilder(name: String, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/summ/keywords"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get the keywords from HTML document from Web specified by its URL using the keyword detection service
     
     - parameter sourceUrl: (query) Source document URL. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDetectHtmlKeywordsByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getDetectHtmlKeywordsByUrlWithRequestBuilder(sourceUrl: sourceUrl).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Get the keywords from HTML document from Web specified by its URL using the keyword detection service
     - GET /html/summ/keywords
     - examples: [{contentType=application/json, example=""}]
     
     - parameter sourceUrl: (query) Source document URL. 

     - returns: RequestBuilder<Data>
     */
    open class func getDetectHtmlKeywordsByUrlWithRequestBuilder(sourceUrl: String) -> RequestBuilder<Data> {
        let path = "/html/summ/keywords"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Translate the HTML document specified by the name from default or specified storage. 
     
     - parameter name: (path) Document name. 
     - parameter srcLang: (path) Source language. 
     - parameter resLang: (path) Result language. 
     - parameter storage: (query) The source document storage. (optional)
     - parameter folder: (query) The source document folder. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTranslateDocument(name: String, srcLang: String, resLang: String, storage: String? = nil, folder: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getTranslateDocumentWithRequestBuilder(name: name, srcLang: srcLang, resLang: resLang, storage: storage, folder: folder).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Translate the HTML document specified by the name from default or specified storage. 
     - GET /html/{name}/translate/{srcLang}/{resLang}
     - examples: [{output=none}]
     
     - parameter name: (path) Document name. 
     - parameter srcLang: (path) Source language. 
     - parameter resLang: (path) Result language. 
     - parameter storage: (query) The source document storage. (optional)
     - parameter folder: (query) The source document folder. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getTranslateDocumentWithRequestBuilder(name: String, srcLang: String, resLang: String, storage: String? = nil, folder: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{name}/translate/{srcLang}/{resLang}"
        path = path.replacingOccurrences(of: "{name}", with: "\(name)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{srcLang}", with: "\(srcLang)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{resLang}", with: "\(resLang)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "storage": storage, 
            "folder": folder
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Translate the HTML document from Web specified by its URL.
     
     - parameter sourceUrl: (query) Source document URL. 
     - parameter srcLang: (path) Source language. 
     - parameter resLang: (path) Result language. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTranslateDocumentByUrl(sourceUrl: String, srcLang: String, resLang: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getTranslateDocumentByUrlWithRequestBuilder(sourceUrl: sourceUrl, srcLang: srcLang, resLang: resLang).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Translate the HTML document from Web specified by its URL.
     - GET /html/translate/{srcLang}/{resLang}
     - examples: [{output=none}]
     
     - parameter sourceUrl: (query) Source document URL. 
     - parameter srcLang: (path) Source language. 
     - parameter resLang: (path) Result language. 

     - returns: RequestBuilder<Data>
     */
    open class func getTranslateDocumentByUrlWithRequestBuilder(sourceUrl: String, srcLang: String, resLang: String) -> RequestBuilder<Data> {
        var path = "/html/translate/{srcLang}/{resLang}"
        path = path.replacingOccurrences(of: "{srcLang}", with: "\(srcLang)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{resLang}", with: "\(resLang)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "sourceUrl": sourceUrl
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    /**
     Populate HTML document template with data located as a file in the storage.
     
     - parameter templateName: (path) Template document name. Template document is HTML or zipped HTML. 
     - parameter dataPath: (query) Data source file path in the storage. Supported data format: XML 
     - parameter options: (query) Template merge options: reserved for further implementation. (optional)
     - parameter folder: (query) The template document folder. (optional)
     - parameter storage: (query) The template document and data source storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getMergeHtmlTemplate(templateName: String, dataPath: String, options: String? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        getMergeHtmlTemplateWithRequestBuilder(templateName: templateName, dataPath: dataPath, options: options, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Populate HTML document template with data located as a file in the storage.
     - GET /html/{templateName}/merge
     - examples: [{output=none}]
     
     - parameter templateName: (path) Template document name. Template document is HTML or zipped HTML. 
     - parameter dataPath: (query) Data source file path in the storage. Supported data format: XML 
     - parameter options: (query) Template merge options: reserved for further implementation. (optional)
     - parameter folder: (query) The template document folder. (optional)
     - parameter storage: (query) The template document and data source storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func getMergeHtmlTemplateWithRequestBuilder(templateName: String, dataPath: String, options: String? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{templateName}/merge"
        path = path.replacingOccurrences(of: "{templateName}", with: "\(templateName)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "dataPath": dataPath, 
            "options": options, 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Populate HTML document template with data from the request body. Result document will be saved to storage.
     
     - parameter templateName: (path) Template document name. Template document is HTML or zipped HTML. 
     - parameter outPath: (query) Result document path. 
     - parameter file: (form) A data file to populate template. 
     - parameter options: (query) Template merge options: reserved for further implementation. (optional)
     - parameter folder: (query) The template document folder. (optional)
     - parameter storage: (query) The template document and data source storage. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postMergeHtmlTemplate(templateName: String, outPath: String, file: URL, options: String? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        postMergeHtmlTemplateWithRequestBuilder(templateName: templateName, outPath: outPath, file: file, options: options, folder: folder, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    /**
     Populate HTML document template with data from the request body. Result document will be saved to storage.
     - POST /html/{templateName}/merge
     - examples: [{contentType=application/json, example=""}]
     
     - parameter templateName: (path) Template document name. Template document is HTML or zipped HTML. 
     - parameter outPath: (query) Result document path. 
     - parameter file: (form) A data file to populate template. 
     - parameter options: (query) Template merge options: reserved for further implementation. (optional)
     - parameter folder: (query) The template document folder. (optional)
     - parameter storage: (query) The template document and data source storage. (optional)

     - returns: RequestBuilder<Data>
     */
    open class func postMergeHtmlTemplateWithRequestBuilder(templateName: String, outPath: String, file: URL, options: String? = nil, folder: String? = nil, storage: String? = nil) -> RequestBuilder<Data> {
        var path = "/html/{templateName}/merge"
        path = path.replacingOccurrences(of: "{templateName}", with: "\(templateName)", options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "outPath": outPath, 
            "options": options, 
            "folder": folder, 
            "storage": storage
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
