/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="StorageAPI.swift">
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

//************************************
//            Storage API
//************************************

open class StorageAPI {
    /**
     Get disc usage
     - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDiscUsage(storageName: String? = nil, completion: @escaping ((_ data: DiscUsage?,_ error: Error?) -> Void)) {
        getDiscUsageWithRequestBuilder(storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get disc usage
     - GET /html/storage/disc/usage
     - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<DiscUsage>
     */
    open class func getDiscUsageWithRequestBuilder(storageName: String? = nil) -> RequestBuilder<DiscUsage> {
        let path = "/html/storage/disc/usage"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<DiscUsage>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Check if file or folder exists
     - parameter path: (query) File or folder path e.g. '/file.ext' or '/folder'
	 - parameter storageName: (query) Storage name (optional)     
	 - parameter versionId: (query) File version ID (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func objectExists(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: ObjectExist?,_ error: Error?) -> Void)) {
        objectExistsWithRequestBuilder(pathInner: path, storageName: storageName, versionId: versionId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Check if file or folder exists
     - GET /html/storage/exist
     - parameter path: (query) File or folder path e.g. '/file.ext' or '/folder'
	 - parameter storageName: (query) Storage name (optional)     
	 - parameter versionId: (query) File version ID (optional)

     - returns: RequestBuilder<ObjectExist> 
     */
    open class func objectExistsWithRequestBuilder(pathInner: String, storageName: String? = nil, versionId: String? = nil) -> RequestBuilder<ObjectExist> {
        let path = "/html/storage/exist"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName,
            "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<ObjectExist>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Check if storage exists
     - parameter storageName: (query) Storage name
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func storageExists(storageName: String, completion: @escaping ((_ data: StorageExist?,_ error: Error?) -> Void)) {
        storageExistsWithRequestBuilder(storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Check if storage exists
     - GET /html/storage/exist/storage
     - parameter storageName: (query) Storage name

     - returns: RequestBuilder<StorageExist> 
     */
    open class func storageExistsWithRequestBuilder(storageName: String) -> RequestBuilder<StorageExist> {
        let path = "/html/storage/exist/storage"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<StorageExist>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
//************************************
//              File API
//************************************

    /**
     Delete file
     - parameter path: (query) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to delete (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteFileWithRequestBuilder(pathInner: path, storageName: storageName, versionId: versionId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete file
     - DELETE /html/file
     - parameter path: (query) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to delete (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func deleteFileWithRequestBuilder(pathInner: String, storageName: String? = nil, versionId: String? = nil) -> RequestBuilder<Void> {
        let path = "/html/file"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName,
            "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Download file
     - parameter path: (query) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to download (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func downloadFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        downloadFileWithRequestBuilder(pathInner: path, storageName: storageName, versionId: versionId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Download file
     - GET /html/file
     - parameter path: (query) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to download (optional)

     - returns: RequestBuilder<Data>
     */
    open class func downloadFileWithRequestBuilder(pathInner: String, storageName: String? = nil, versionId: String? = nil) -> RequestBuilder<Data> {
        let path = "/html/file"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName,
            "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Upload file
     - parameter file: (form)
	 - parameter path: (path) Path where to upload excluding filename e.g. / or /Folder
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadFile(file: URL, path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesUploadResult?,_ error: Error?) -> Void)) {
        uploadFileWithRequestBuilder(file: file, pathInner: path, storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Upload file
     - POST /html/file
     - parameter file: (form)
	 - parameter path: (query) Path where to upload excluding filename e.g. / or /Folder
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<FilesUploadResult> 
     */
    open class func uploadFileWithRequestBuilder(file: URL, pathInner: String, storageName: String? = nil) -> RequestBuilder<FilesUploadResult> {
        let path = "/html/file"
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<FilesUploadResult>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    
//************************************
//           Folder API
//************************************
    /**
     Create the folder
     - parameter path: (path) Folder path to create e.g. 'folder_1/folder_2/'
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createFolder(path: String, storageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createFolderWithRequestBuilder(pathInner: path, storageName: storageName).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Create the folder
     - POST /html/folder
     - parameter path: (query) Folder path to create e.g. 'folder_1/folder_2/'
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func createFolderWithRequestBuilder(pathInner: String, storageName: String? = nil) -> RequestBuilder<Void> {
        let path = "/html/folder"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete folder
     - parameter path: (query) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter recursive: (query) Enable to delete folders, subfolders and files (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteFolder(path: String, storageName: String? = nil, recursive: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteFolderWithRequestBuilder(pathInner: path, storageName: storageName, recursive: recursive).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete folder
     - DELETE /html/folder
     - parameter path: (query) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter recursive: (query) Enable to delete folders, subfolders and files (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func deleteFolderWithRequestBuilder(pathInner: String, storageName: String? = nil, recursive: Bool? = nil) -> RequestBuilder<Void> {
        let path = "/html/folder"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName,
            "recursive": recursive
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all files and folders within a folder
     - parameter path: (query) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getFilesList(path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesList?,_ error: Error?) -> Void)) {
        getFilesListWithRequestBuilder(pathInner: path, storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get all files and folders within a folder
     - GET /html/folder
     - parameter path: (query) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<FilesList> 
     */
    open class func getFilesListWithRequestBuilder(pathInner: String, storageName: String? = nil) -> RequestBuilder<FilesList> {
        let path = "/html/folder"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
            "path": pathInner,
            "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<FilesList>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
}
