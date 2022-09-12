# FileApi

All URIs are relative to *https://api.aspose.cloud/v4.0*

| Method                            | Description              |
|-----------------------------------|--------------------------|
| [**downloadFile**](#downloadfile) | Download a specific file |
| [**uploadFile**](#uploadfile)     | Upload a specific file   |
| [**deleteFile**](#deletefile)     | Remove a specific file   |

## downloadFile
open class func downloadFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))   

Download a specific file 

### Parameters

| Name            | Type        | Description                                                           | Notes      |
|-----------------|-------------|-----------------------------------------------------------------------|------------|
| **path**        | **String**  | Path of the file including the file name and extension e.g. /file.ext |            |
| **storageName** | **String?** | User&#39;s storage name                                               | [optional] |
| **versionId**   | **String?** | File&#39;s version                                                    | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

 
## uploadFile
open class func uploadFile(file: URL, path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesUploadResult?,_ error: Error?) -> Void))

Upload a specific file 

### Parameters

| Name            | Type        | Description                                                              | Notes      |
|-----------------|-------------|--------------------------------------------------------------------------|------------|
| **file**        | **URL**     | File to upload                                                           |            |
| **path**        | **String**  | Path where to upload excluding filename and extension e.g. / or /Folder  |            |
| **storageName** | **String?** | User&#39;s storage name                                                  | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)
 
 
## deleteFile
open class func deleteFile(path: String, storageName: String? = nil, versionId: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))

Remove a specific file 

### Parameters

| Name            | Type        | Description                                                               | Notes      |
|-----------------|-------------|---------------------------------------------------------------------------|------------|
| **path**        | **String**  | Path of the file including file name and extension e.g. /Folder1/file.ext |            |
| **storageName** | **String?** | User&#39;s storage name                                                   | [optional] |
| **versionId**   | **String?** | File&#39;s version                                                        | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)
