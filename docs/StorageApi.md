# StorageApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDiscUsage**](StorageApi.md#getDiscUsage) | **GET** /html/storage/disc | Check the disk usage of the current account 
[**objectExists**](StorageApi.md#objectExists) | **GET** /html/storage/exist/{path} | Check if a specific file or folder exists
[**storageExists**](StorageApi.md#storageExists) | **GET** /html/storage/{storageName}/exist | Check if storage exists 
[**getFileVersions**](StorageApi.md#getFileVersions) | **GET** /html/storage/version/{path} | Get the file&#39;s versions list 


<a name="getDiscUsage"></a>
# **getDiscUsage**
open class func getDiscUsage(storageName: String? = nil, completion: @escaping ((_ data: DiscUsage?,_ error: Error?) -> Void))

Check the disk usage of the current account 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storageName** | **String?**| User&#39;s storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="objectExists"></a>
# **objectExists**
open class func objectExists(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: ObjectExist?,_ error: Error?) -> Void))

Check if a specific file or folder exists

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| File or folder path e.g. /file.ext or /Folder1 |
 **storageName** | **String?**| User&#39;s storage name | [optional]
 **versionId** | **String?**| File&#39;s version | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="storageExists"></a>
# **storageExists**
open class func storageExists(storageName: String, completion: @escaping ((_ data: StorageExist?,_ error: Error?) -> Void))

Check if storage exists 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storageName** | **String**| Storage name |

[[Back to top]](#) [[Back to README]](../README.md)
 
 
<a name="getFileVersions"></a>
# **getFileVersions**
open class func getFileVersions(path: String, storageName: String? = nil, completion: @escaping ((_ data: FileVersions?,_ error: Error?) -> Void))

Get the file&#39;s versions list 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| File path e.g. /file.ext or /Folder1/file.ext |
 **storageName** | **String?**| User&#39;s storage name | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 