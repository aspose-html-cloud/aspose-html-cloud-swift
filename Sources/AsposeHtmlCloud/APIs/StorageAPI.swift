/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="StorageAPI.swift">
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
     - GET /html/storage/disc
     - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<DiscUsage> 
     */
    open class func getDiscUsageWithRequestBuilder(storageName: String? = nil) -> RequestBuilder<DiscUsage> {
        let path = "/html/storage/disc"
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
     Get file versions
     - parameter path: (path) File path e.g. '/file.ext'      
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getFileVersions(path: String, storageName: String? = nil, completion: @escaping ((_ data: FileVersions?,_ error: Error?) -> Void)) {
        getFileVersionsWithRequestBuilder(path: path, storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get file versions
     - GET /html/storage/version/{path}

     - parameter path: (path) File path e.g. '/file.ext'      
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<FileVersions> 
     */
    open class func getFileVersionsWithRequestBuilder(path: String, storageName: String? = nil) -> RequestBuilder<FileVersions> {
        let pathInner = "/html/storage/version/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<FileVersions>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Check if file or folder exists
     - parameter path: (path) File or folder path e.g. '/file.ext' or '/folder'      
	 - parameter storageName: (query) Storage name (optional)     
	 - parameter versionId: (query) File version ID (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func objectExists(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: ObjectExist?,_ error: Error?) -> Void)) {
        objectExistsWithRequestBuilder(path: path, storageName: storageName, versionId: versionId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Check if file or folder exists
     - GET /html/storage/exist/{path}
     - parameter path: (path) File or folder path e.g. '/file.ext' or '/folder'      
	 - parameter storageName: (query) Storage name (optional)     
	 - parameter versionId: (query) File version ID (optional)

     - returns: RequestBuilder<ObjectExist> 
     */
    open class func objectExistsWithRequestBuilder(path: String, storageName: String? = nil, versionId: String? = nil) -> RequestBuilder<ObjectExist> {
        let pathInner = "/html/storage/exist/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName, 
                        "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<ObjectExist>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Check if storage exists
     - parameter storageName: (path) Storage name 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func storageExists(storageName: String, completion: @escaping ((_ data: StorageExist?,_ error: Error?) -> Void)) {
        storageExistsWithRequestBuilder(storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Check if storage exists
     - GET /html/storage/{storageName}/exist
     - parameter storageName: (path) Storage name 

     - returns: RequestBuilder<StorageExist> 
     */
    open class func storageExistsWithRequestBuilder(storageName: String) -> RequestBuilder<StorageExist> {
        let pathInner = "/html/storage/{storageName}/exist"
        let storageNamePreEscape = "\(storageName)"
        let storageNamePostEscape = storageNamePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{storageName}", with: storageNamePostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<StorageExist>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
//************************************
//              File API
//************************************
    /**
     Copy file
     - parameter srcPath: (path) Source file path e.g. '/folder/file.ext'      
	 - parameter destPath: (query) Destination file path      
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)
	 - parameter versionId: (query) File version ID to copy (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func copyFile(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        copyFileWithRequestBuilder(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName, versionId: versionId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Copy file
     - PUT /html/storage/file/copy/{srcPath}
     - parameter srcPath: (path) Source file path e.g. '/folder/file.ext'
	 - parameter destPath: (query) Destination file path
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)
	 - parameter versionId: (query) File version ID to copy (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func copyFileWithRequestBuilder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, versionId: String? = nil) -> RequestBuilder<Void> {
        var path = "/html/storage/file/copy/{srcPath}"
        let srcPathPreEscape = "\(srcPath)"
        let srcPathPostEscape = srcPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{srcPath}", with: srcPathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "destPath": destPath, 
                        "srcStorageName": srcStorageName, 
                        "destStorageName": destStorageName, 
                        "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete file
     - parameter path: (path) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to delete (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteFileWithRequestBuilder(path: path, storageName: storageName, versionId: versionId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete file
     - DELETE /html/storage/file/{path}
     - parameter path: (path) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to delete (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func deleteFileWithRequestBuilder(path: String, storageName: String? = nil, versionId: String? = nil) -> RequestBuilder<Void> {
        let pathInner = "/html/storage/file/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName, 
                        "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Download file
     - parameter path: (path) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to download (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func downloadFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void)) {
        downloadFileWithRequestBuilder(path: path, storageName: storageName, versionId: versionId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Download file
     - GET /html/storage/file/{path}
     - parameter path: (path) File path e.g. '/folder/file.ext'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter versionId: (query) File version ID to download (optional)

     - returns: RequestBuilder<Data>
     */
    open class func downloadFileWithRequestBuilder(path: String, storageName: String? = nil, versionId: String? = nil) -> RequestBuilder<Data> {
        let pathInner = "/html/storage/file/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName, 
                        "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<Data>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Move file
     - parameter srcPath: (path) Source file path e.g. '/src.ext'
	 - parameter destPath: (query) Destination file path e.g. '/dest.ext'
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)
	 - parameter versionId: (query) File version ID to move (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func moveFile(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        moveFileWithRequestBuilder(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName, versionId: versionId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Move file
     - PUT /html/storage/file/move/{srcPath}
     - parameter srcPath: (path) Source file path e.g. '/src.ext'
	 - parameter destPath: (query) Destination file path e.g. '/dest.ext'
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)
	 - parameter versionId: (query) File version ID to move (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func moveFileWithRequestBuilder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, versionId: String? = nil) -> RequestBuilder<Void> {
        let pathInner = "/html/storage/file/move/{srcPath}"
        let srcPathPreEscape = "\(srcPath)"
        let srcPathPostEscape = srcPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{srcPath}", with: srcPathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "destPath": destPath, 
                        "srcStorageName": srcStorageName, 
                        "destStorageName": destStorageName, 
                        "versionId": versionId
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Upload file
     - parameter file: (form)
	 - parameter path: (path) Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext If the content is multipart and path does not contains the file name it tries to get them from filename parameter from Content-Disposition header.
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadFile(file: URL, path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesUploadResult?,_ error: Error?) -> Void)) {
        uploadFileWithRequestBuilder(file: file, path: path, storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Upload file
     - PUT /html/storage/file/{path}
     - parameter file: (form)
	 - parameter path: (path) Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext If the content is multipart and path does not contains the file name it tries to get them from filename parameter from Content-Disposition header.
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<FilesUploadResult> 
     */
    open class func uploadFileWithRequestBuilder(file: URL, path: String, storageName: String? = nil) -> RequestBuilder<FilesUploadResult> {
        let pathInner = "/html/storage/file/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let formParams: [String:Any?] = [
                        "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<FilesUploadResult>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    
//************************************
//           Folder API
//************************************
    /**
     Copy folder
     - parameter srcPath: (path) Source folder path e.g. '/src'
	 - parameter destPath: (query) Destination folder path e.g. '/dst'
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func copyFolder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        copyFolderWithRequestBuilder(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Copy folder
     - PUT /html/storage/folder/copy/{srcPath}
     - parameter srcPath: (path) Source folder path e.g. '/src'
	 - parameter destPath: (query) Destination folder path e.g. '/dst'
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func copyFolderWithRequestBuilder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil) -> RequestBuilder<Void> {
        var path = "/html/storage/folder/copy/{srcPath}"
        let srcPathPreEscape = "\(srcPath)"
        let srcPathPostEscape = srcPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{srcPath}", with: srcPathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "destPath": destPath, 
                        "srcStorageName": srcStorageName, 
                        "destStorageName": destStorageName
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Create the folder
     - parameter path: (path) Folder path to create e.g. 'folder_1/folder_2/'
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createFolder(path: String, storageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createFolderWithRequestBuilder(path: path, storageName: storageName).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Create the folder
     - PUT /html/storage/folder/{path}
     - parameter path: (path) Folder path to create e.g. 'folder_1/folder_2/'
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func createFolderWithRequestBuilder(path: String, storageName: String? = nil) -> RequestBuilder<Void> {
        let pathInner = "/html/storage/folder/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete folder
     - parameter path: (path) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter recursive: (query) Enable to delete folders, subfolders and files (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteFolder(path: String, storageName: String? = nil, recursive: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteFolderWithRequestBuilder(path: path, storageName: storageName, recursive: recursive).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete folder
     - DELETE /html/storage/folder/{path}
     - parameter path: (path) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)
	 - parameter recursive: (query) Enable to delete folders, subfolders and files (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func deleteFolderWithRequestBuilder(path: String, storageName: String? = nil, recursive: Bool? = nil) -> RequestBuilder<Void> {
        let pathInner = "/html/storage/folder/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName, 
                        "recursive": recursive
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all files and folders within a folder
     - parameter path: (path) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getFilesList(path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesList?,_ error: Error?) -> Void)) {
        getFilesListWithRequestBuilder(path: path, storageName: storageName).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get all files and folders within a folder
     - GET /html/storage/folder/{path}
     - parameter path: (path) Folder path e.g. '/folder'
	 - parameter storageName: (query) Storage name (optional)

     - returns: RequestBuilder<FilesList> 
     */
    open class func getFilesListWithRequestBuilder(path: String, storageName: String? = nil) -> RequestBuilder<FilesList> {
        let pathInner = "/html/storage/folder/{path}"
        let pathPreEscape = "\(path)"
        let pathPostEscape = pathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let path = pathInner.replacingOccurrences(of: "{path}", with: pathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "storageName": storageName
        ])

        let requestBuilder: RequestBuilder<FilesList>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Move folder
     - parameter srcPath: (path) Folder path to move e.g. '/folder'
	 - parameter destPath: (query) Destination folder path to move to e.g '/dst'
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func moveFolder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        moveFolderWithRequestBuilder(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Move folder
     - PUT /html/storage/folder/move/{srcPath}
     - parameter srcPath: (path) Folder path to move e.g. '/folder'
	 - parameter destPath: (query) Destination folder path to move to e.g '/dst'
	 - parameter srcStorageName: (query) Source storage name (optional)
     - parameter destStorageName: (query) Destination storage name (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func moveFolderWithRequestBuilder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil) -> RequestBuilder<Void> {
        var path = "/html/storage/folder/move/{srcPath}"
        let srcPathPreEscape = "\(srcPath)"
        let srcPathPostEscape = srcPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{srcPath}", with: srcPathPostEscape, options: .literal, range: nil)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: [
                        "destPath": destPath, 
                        "srcStorageName": srcStorageName, 
                        "destStorageName": destStorageName
        ])

        let requestBuilder: RequestBuilder<Void>.Type = ClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
}
