# FolderApi

All URIs are relative to *https://api.aspose.cloud/v4.0*

| Method                            | Description                               |
|-----------------------------------|-------------------------------------------|
| [**createFolder**](#createfolder) | Create the folder                         |
| [**deleteFolder**](#deletefolder) | Remove a specific folder                  |
| [**getFilesList**](#getfileslist) | Get the file listing of a specific folder |

## createFolder
open class func createFolder(path: String, storageName: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))    

Create the folder 

### Parameters

| Name            | Type        | Description                                                                             | Notes      |
|-----------------|-------------|-----------------------------------------------------------------------------------------|------------|
| **path**        | **String**  | Target folder&#39;s path e.g. Folder1/Folder2/. The folders will be created recursively |            |
| **storageName** | **String?** | User&#39;s source storage name                                                          | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)
 
 
## deleteFolder
open class func deleteFolder(path: String, storageName: String? = nil, recursive: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void))

Remove a specific folder 

### Parameters

| Name            | Type         | Description                                                                                         | Notes                         |
|-----------------|--------------|-----------------------------------------------------------------------------------------------------|-------------------------------|
| **path**        | **String**   | Folder path e.g. /Folder1                                                                           |                               |
| **storageName** | **String?**  | User&#39;s storage name                                                                             | [optional]                    |
| **recursive**   | **Boolean?** | Remove recursivelly inner folder/files. If false and folder contains data than exception is raised. | [optional] [default to false] |

[[Back to top]](#) [[Back to README]](../README.md)
 
## getFilesList
open class func getFilesList(path: String, storageName: String? = nil, completion: @escaping ((_ data: FilesList?,_ error: Error?) -> Void))

Get the file listing of a specific folder 

### Parameters

| Name            | Type        | Description                                                                                 | Notes                     |
|-----------------|-------------|---------------------------------------------------------------------------------------------|---------------------------|
| **path**        | **String?** | Start with name of storage e.g. root folder &#39;/&#39;or some folder &#39;/folder1/..&#39; | [optional] [default to /] |
| **storageName** | **String?** | User&#39;s storage name                                                                     | [optional]                |

[[Back to top]](#) [[Back to README]](../README.md)
