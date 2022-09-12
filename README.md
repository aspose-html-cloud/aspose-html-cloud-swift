# Aspose HTML Cloud SDK 

This repository contains Aspose.HTML Cloud SDK source code. This SDK allows you to work with Aspose.HTML Cloud REST APIs in your applications quickly and easily.

See [API Reference](https://apireference.aspose.cloud/html/) for full API specification.

## How to use the SDK?
The complete source code is available in this repository folder, you can either directly use it in your project.

## Requirements
- mac OS X 10.12.6
- XCode 9.2
- Swift 5.1 and later   
- Alamofire 4.9.1 and later

### Prerequisites

To use Aspose HTML for Cloud SDK you need to register an account with [Aspose Cloud](https://www.aspose.cloud/) and lookup/create App Key and SID at [Cloud Dashboard](https://dashboard.aspose.cloud/#/apps). There is free quota available. For more details, see [Aspose Cloud Pricing](https://purchase.aspose.cloud/pricing).


## Installation & Usage

## Getting Started

Before create configuration, then use HtmlAPI or StorageAPI (see tests)   

Example:   
```swift
    ClientAPI.setConfig(
        basePath: "https://api.aspose.cloud/v4.0", 
        authPath: "https://api.aspose.cloud/connect/token", 
        apiKey: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 
        appSID: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", 
        debugging: true
    )
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aspose.cloud/v4.0*


| Class     | Method                                                                       | Description                                                              |
|-----------|------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| *HtmlAPI* | [**convertLocalToLocal**](docs/ConversionApi.md#convertlocaltolocal)         | Convert the HTML or EPUB document from local disk to a local disk.       |
| *HtmlAPI* | [**convertLocalToStorage**](docs/ConversionApi.md#convertlocaltostorage)     | Convert the HTML or EPUB document from local disk to user's storage.     |
| *HtmlAPI* | [**convertStorageToLocal**](docs/ConversionApi.md#convertstoragetolocal)     | Convert the HTML or EPUB document from user's storage to local disk.     |
| *HtmlAPI* | [**convertStorageToStorage**](docs/ConversionApi.md#convertstoragetostorage) | Convert the HTML or EPUB document from user's storage to user's storage. |
| *HtmlAPI* | [**convertUrlToLocal**](docs/ConversionApi.md#converturltolocal)             | Convert the HTML document by URL to local disk.                          |
| *HtmlAPI* | [**convertUrlToStorage**](docs/ConversionApi.md#converturltostorage)         | Convert the HTML document by URL to user's storage.                      |
| *HtmlAPI* | [**convert**](docs/ConversionApi.md#convert)                                 | Convert the HTML, EPUB or URL to the specified format.                   |

## Documentation For Authorization

## oauth

- **Type**: OAuth2
- **Flow**: application
- **Authorization URL**: "https://api.aspose.cloud/connect/token"
- **Scopes**: N/A

### Examples
Test uses StorageApi for upload(download) file to(from) remote storage. 

## Documentation for Storage API Endpoints

All URIs are relative to *https://api.aspose.cloud/v4.0*

| Class        | Method                                                | Description                               |
|--------------|-------------------------------------------------------|-------------------------------------------|
| *StorageAPI* | [**deleteFile**](docs/FileApi.md#deletefile)          | Delete file                               |
| *StorageAPI* | [**downloadFile**](docs/FileApi.md#downloadfile)      | Download file                             |
| *StorageAPI* | [**uploadFile**](docs/FileApi.md#uploadfile)          | Upload file                               |
| *StorageAPI* | [**createFolder**](docs/FolderApi.md#createfolder)    | Create the folder                         |
| *StorageAPI* | [**deleteFolder**](docs/FolderApi.md#deletefolder)    | Delete folder                             |
| *StorageAPI* | [**getFilesList**](docs/FolderApi.md#getfileslist)    | Get all files and folders within a folder |
| *StorageAPI* | [**getDiscUsage**](docs/StorageApi.md#getdiscusage)   | Get disc usage                            |
| *StorageAPI* | [**objectExists**](docs/StorageApi.md#objectexists)   | Check if file or folder exists            |
| *StorageAPI* | [**storageExists**](docs/StorageApi.md#storageexists) | Check if storage exists                   |

## Documentation for Models

 - [DiscUsage](docs/DiscUsage.md)
 - [ErrorDetails](docs/ErrorDetails.md)
 - [FilesList](docs/FilesList.md)
 - [FilesUploadResult](docs/FilesUploadResult.md)
 - [FileVersion](docs/FileVersion.md)
 - [FileVersions](docs/FileVersions.md)
 - [ModelError](docs/ModelError.md)
 - [ObjectExist](docs/ObjectExists.md)
 - [StorageExist](docs/StorageExist.md)
 - [StorageFile](docs/StorageFile.md)


[Tests](./Tests/AsposeHtmlTests/) contain various examples of using the Aspose.HTML and Aspose.Storage SDK.
