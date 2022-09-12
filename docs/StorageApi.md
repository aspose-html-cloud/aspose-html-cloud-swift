# StorageApi

All URIs are relative to *https://api.aspose.cloud/v4.0*

| Method                              | Description                                 |
|-------------------------------------|---------------------------------------------|
| [**getDiscUsage**](#getdiscusage)   | Check the disk usage of the current account |
| [**objectExists**](#objectexists)   | Check if a specific file or folder exists   |
| [**storageExists**](#storageexists) | Check if storage exists                     |

## getDiscUsage
open class func getDiscUsage(storageName: String? = nil, completion: @escaping ((_ data: DiscUsage?,_ error: Error?) -> Void))

Check the disk usage of the current account 

### Parameters

| Name            | Type        | Description             | Notes      |
|-----------------|-------------|-------------------------|------------|
| **storageName** | **String?** | User&#39;s storage name | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)
 
 
## objectExists
open class func objectExists(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: ObjectExist?,_ error: Error?) -> Void))

Check if a specific file or folder exists

### Parameters

| Name            | Type        | Description                                    | Notes      |
|-----------------|-------------|------------------------------------------------|------------|
| **path**        | **String**  | File or folder path e.g. /file.ext or /Folder1 |            |
| **storageName** | **String?** | User&#39;s storage name                        | [optional] |
| **versionId**   | **String?** | File&#39;s version                             | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)
 
 
## storageExists
open class func storageExists(storageName: String, completion: @escaping ((_ data: StorageExist?,_ error: Error?) -> Void))

Check if storage exists 

### Parameters

| Name            | Type       | Description  | Notes |
|-----------------|------------|--------------|-------|
| **storageName** | **String** | Storage name |       |

[[Back to top]](#) [[Back to README]](../README.md)
