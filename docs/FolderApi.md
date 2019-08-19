# FolderApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFolder**](FolderApi.md#createFolder) | **PUT** /html/storage/folder/{path} | Create the folder 
[**copyFolder**](FolderApi.md#copyFolder) | **PUT** /html/storage/folder/copy/{srcPath} | Copy a specific folder 
[**moveFolder**](FolderApi.md#moveFolder) | **PUT** /html/storage/folder/move/{srcPath} | Move a specific folder 
[**deleteFolder**](FolderApi.md#deleteFolder) | **DELETE** /html/storage/folder/{path} | Remove a specific folder 
[**getFilesList**](FolderApi.md#getFilesList) | **GET** /html/storage/folder/{path} | Get the file listing of a specific folder 

 
<a name="createFolder"></a>
# **createFolder**
open class func createFolder(path: String, storageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))    

Create the folder 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| Target folder&#39;s path e.g. Folder1/Folder2/. The folders will be created recursively |
 **storageName** | **String?**| User&#39;s source storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="copyFolder"></a>
# **copyFolder**
open class func copyFolder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))

Copy a specific folder 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **srcPath** | **String**| Source folder path e.g. /Folder1 |
 **destPath** | **String**| Destination folder path e.g. /Folder2 |
 **srcStorageName** | **String?**| User&#39;s source storage name | [optional]
 **destStorageName** | **String?**| User&#39;s destination storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

 
<a name="moveFolder"></a>
# **moveFolder**
open class func moveFolder(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))

Move a specific folder 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **srcPath** | **String**| Source folder path e.g. /Folder1 |
 **destPath** | **String**| Destination folder path e.g. /Folder2 |
 **srcStorageName** | **String?**| User&#39;s source storage name | [optional]
 **destStorageName** | **String?**| User&#39;s destination storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="deleteFolder"></a>
# **deleteFolder**
open class func deleteFolder(path: String, storageName: String? = nil, recursive: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))

Remove a specific folder 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| Folder path e.g. /Folder1 |
 **storageName** | **String?**| User&#39;s storage name | [optional]
 **recursive** | **Boolean?**| Remove recursivelly inner folder/files. If false and folder contains data than exception is raised. | [optional] [default to false]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="getFilesList"></a>
# **getFilesList**
open class func getFilesList(path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesList?,_ error: Error?) -> Void))

Get the file listing of a specific folder 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String?**| Start with name of storage e.g. root folder &#39;/&#39;or some folder &#39;/folder1/..&#39; | [optional] [default to /]
 **storageName** | **String?**| User&#39;s storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
