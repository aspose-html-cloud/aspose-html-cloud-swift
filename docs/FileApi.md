# FileApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadFile**](FileApi.md#downloadFile) | **GET** /html/storage/file/{path} | Download a specific file 
[**uploadFile**](FileApi.md#uploadFile) | **PUT** /html/storage/file/{path} | Upload a specific file 
[**copyFile**](FileApi.md#copyFile) | **PUT** /html/storage/file/copy/{srcPath} | Copy a specific file 
[**moveFile**](FileApi.md#moveFile) | **PUT** /html/storage/file/move/{srcPath} | Move a specific file 
[**deleteFile**](FileApi.md#deleteFile) | **DELETE** /html/storage/file/{path} | Remove a specific file 


<a name="downloadFile"></a>
# **downloadFile**
open class func downloadFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))   

Download a specific file 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| Path of the file including the file name and extension e.g. /file.ext |
 **storageName** | **String?**| User&#39;s storage name | [optional]
 **versionId** | **String?**| File&#39;s version | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

 
<a name="uploadFile"></a>
# **uploadFile**
open class func uploadFile(file: URL, path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesUploadResult?,_ error: Error?) -> Void))

Upload a specific file 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **URL**| File to upload |
 **path** | **String**| Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext |
 **storageName** | **String?**| User&#39;s storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="copyFile"></a>
# **copyFile**
open class func copyFile(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))   

Copy a specific file 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **srcPath** | **String**| Source file path e.g. /fileSource.ext |
 **destPath** | **String**| Destination file path e.g. /fileDestination.ext |
 **srcStorageName** | **String?**| User&#39;s source storage name | [optional]
 **destStorageName** | **String?**| User&#39;s destination storage name | [optional]
 **versionId** | **String?**| Source file&#39;s version, | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="moveFile"></a>
# **moveFile**
open class func moveFile(srcPath: String, destPath: String, srcStorageName: String? = nil, destStorageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))   

Move a specific file 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **srcPath** | **String**| Source file path e.g. /fileSource.ext |
 **destPath** | **String**| Destination file path e.g. /fileDestination.ext |
 **srcStorageName** | **String?**| User&#39;s source storage name | [optional]
 **destStorageName** | **String?**| User&#39;s destination storage name | [optional]
 **versionId** | **String?**| Source file&#39;s version, | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

 
<a name="deleteFile"></a>
# **deleteFile**
open class func deleteFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))

Remove a specific file 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| Path of the file including file name and extension e.g. /Folder1/file.ext |
 **storageName** | **String?**| User&#39;s storage name | [optional]
 **versionId** | **String?**| File&#39;s version | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
