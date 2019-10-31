# Aspose HTML Cloud SDK 

This repository contains Aspose.HTML Cloud SDK source code. This SDK allows you to work with Aspose.HTML Cloud REST APIs in your applications quickly and easily.

See [API Reference](https://apireference.aspose.cloud/html/) for full API specification.

## How to use the SDK?
The complete source code is available in this repository folder, you can either directly use it in your project.

## Requirements
- mac OS X 10.12.6
- XCode 9.2
- Swift 4.0 and later   
- Alamofire 4.7.3 and later

### Prerequisites

To use Aspose HTML for Cloud SDK you need to register an account with [Aspose Cloud](https://www.aspose.cloud/) and lookup/create App Key and SID at [Cloud Dashboard](https://dashboard.aspose.cloud/#/apps). There is free quota available. For more details, see [Aspose Cloud Pricing](https://purchase.aspose.cloud/pricing).


# Installation & Usage

## Getting Started

Before create configuration, then use HtmlAPI or StorageAPI (see tests)   

Example:   
```swift
    ClientAPI.setConfig(
        basePath: "https://api.aspose.cloud/v3.0", 
        authPath: "https://api.aspose.cloud/connect/token", 
        apiKey: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 
        appSID: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", 
        debugging: true
    )
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aspose.cloud/v3.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | ------------
*HtmlAPI* | [**getConvertDocumentToImage**](docs/ConversionApi.md#getConvertDocumentToImage) | **GET** /html/{name}/convert/image/{outFormat} | Convert the HTML document from the storage by its name to the specified image format.
*HtmlAPI* | [**getConvertDocumentToImageByUrl**](docs/ConversionApi.md#getConvertDocumentToImageByUrl) | **GET** /html/convert/image/{outFormat} | Convert the HTML page from the web by its URL to the specified image format.
*HtmlAPI* | [**getConvertDocumentToPdf**](docs/ConversionApi.md#getConvertDocumentToPdf) | **GET** /html/{name}/convert/pdf | Convert the HTML document from the storage by its name to PDF.
*HtmlAPI* | [**getConvertDocumentToPdfByUrl**](docs/ConversionApi.md#getConvertDocumentToPdfByUrl) | **GET** /html/convert/pdf | Convert the HTML page from the web by its URL to PDF.
*HtmlAPI* | [**getConvertDocumentToXps**](docs/ConversionApi.md#getConvertDocumentToXps) | **GET** /html/{name}/convert/xps | Convert the HTML document from the storage by its name to XPS.
*HtmlAPI* | [**getConvertDocumentToXpsByUrl**](docs/ConversionApi.md#getConvertDocumentToXpsByUrl) | **GET** /html/convert/xps | Convert the HTML page from the web by its URL to XPS.
*HtmlAPI* | [**postConvertDocumentInRequestToImage**](docs/ConversionApi.md#postConvertDocumentInRequestToImage) | **POST** /html/convert/image/{outFormat} | Converts the HTML document (in request content) to the specified image format and uploads resulting file to storage.
*HtmlAPI* | [**postConvertDocumentInRequestToPdf**](docs/ConversionApi.md#postConvertDocumentInRequestToPdf) | **POST** /html/convert/pdf | Converts the HTML document (in request content) to PDF and uploads resulting file to storage.
*HtmlAPI* | [**postConvertDocumentInRequestToXps**](docs/ConversionApi.md#postConvertDocumentInRequestToXps) | **POST** /html/convert/xps | Converts the HTML document (in request content) to XPS and uploads resulting file to storage.
*HtmlAPI* | [**putConvertDocumentToImage**](docs/ConversionApi.md#putConvertDocumentToImage) | **PUT** /html/{name}/convert/image/{outFormat} | Converts the HTML document (located on storage) to the specified image format and uploads resulting file to storage.
*HtmlAPI* | [**putConvertDocumentToPdf**](docs/ConversionApi.md#putConvertDocumentToPdf) | **PUT** /html/{name}/convert/pdf | Converts the HTML document (located on storage) to PDF and uploads resulting file to storage.
*HtmlAPI* | [**putConvertDocumentToXps**](docs/ConversionApi.md#putConvertDocumentToXps) | **PUT** /html/{name}/convert/xps | Converts the HTML document (located on storage) to XPS and uploads resulting file to storage.
*HtmlAPI* | [**getConvertDocumentToMHTMLByUrl**](docs/ConversionApi.md#getConvertDocumentToMHTMLByUrl) | **GET** /html/convert/mhtml | Converts the HTML page from Web by its URL to MHTML returns resulting file in response content.
*HtmlAPI* | [**getConvertDocumentToMarkdown**](docs/ConversionApi.md#getConvertDocumentToMarkdown) | **GET** /html/{name}/convert/md | Converts the HTML document (located on storage) to Markdown and returns resulting file in response content.
*HtmlAPI* | [**postConvertDocumentInRequestToMarkdown**](docs/ConversionApi.md#postConvertDocumentInRequestToMarkdown) | **POST** /html/convert/md | Converts the HTML document (in request content) to Markdown and uploads resulting file to storage by specified path.
*HtmlAPI* | [**putConvertDocumentToMarkdown**](docs/ConversionApi.md#putConvertDocumentToMarkdown) | **PUT** /html/{name}/convert/md | Converts the HTML document (located on storage) to Markdown and uploads resulting file to storage by specified path.
*HtmlAPI* | [**getConvertMarkdownToHtml**](docs/ImportApi.md#getConvertMarkdownToHtml) | **GET** /html/{name}/import/md | Converts the Markdown document (located on storage) to HTML and returns resulting file in response content.
*HtmlAPI* | [**postConvertMarkdownInRequestToHtml**](docs/ImportApi.md#postConvertMarkdownInRequestToHtml) | **POST** /html/import/md | Converts the Markdown document (in request content) to HTML and uploads resulting file to storage by specified path.
*HtmlAPI* | [**putConvertMarkdownToHtml**](docs/ImportApi.md#putConvertMarkdownToHtml) | **PUT** /html/{name}/import/md | Converts the Markdown document (located on storage) to HTML and uploads resulting file to storage by specified path.
*HtmlAPI* | [**getDocumentByUrl**](docs/DocumentApi.md#getDocumentByUrl) | **GET** /html/download | Return all HTML page with linked resources packaged as a ZIP archive by the source page URL.
*HtmlAPI* | [**getDocumentFragmentByXPath**](docs/DocumentApi.md#getDocumentFragmentByXPath) | **GET** /html/{name}/fragments/{outFormat} | Return list of HTML fragments matching the specified XPath query.
*HtmlAPI* | [**getDocumentFragmentByXPathByUrl**](docs/DocumentApi.md#getDocumentFragmentByXPathByUrl) | **GET** /html/fragments/{outFormat} | Return list of HTML fragments matching the specified XPath query by the source page URL.
*HtmlAPI* | [**getDocumentFragmentsByCSSSelector**](docs/DocumentApi.md#getDocumentFragmentsByCSSSelector) | **GET** /html/{name}/fragments/css/{outFormat} | Return list of HTML fragments matching the specified CSS selector.
*HtmlAPI* | [**getDocumentFragmentsByCSSSelectorByUrl**](docs/DocumentApi.md#getDocumentFragmentsByCSSSelectorByUrl) | **GET** /html/fragments/css/{outFormat} | Return list of HTML fragments matching the specified CSS selector by the source page URL.
*HtmlAPI* | [**getDocumentImages**](docs/DocumentApi.md#getDocumentImages) | **GET** /html/{name}/images/all | Return all HTML document images packaged as a ZIP archive.
*HtmlAPI* | [**getDocumentImagesByUrl**](docs/DocumentApi.md#getDocumentImagesByUrl) | **GET** /html/images/all | Return all HTML page images packaged as a ZIP archive by the source page URL.
*HtmlAPI* | [**getMergeHtmlTemplate**](docs/TemplateMergeApi.md#getMergeHtmlTemplate) | **GET** /html/{templateName}/merge | Populate HTML document template with data located as a file in the storage.
*HtmlAPI* | [**postMergeHtmlTemplate**](docs/TemplateMergeApi.md#postMergeHtmlTemplate) | **POST** /html/{templateName}/merge | Populate HTML document template with data from the request body. Result document will be saved to storage.

## Documentation For Authorization

## oauth

- **Type**: OAuth2
- **Flow**: application
- **Authorization URL**: "https://api.aspose.cloud/connect/token"
- **Scopes**: N/A

### Examples
Test uses StorageApi for upload(download) file to(from) remote storage. 

## Documentation for Storage API Endpoints

All URIs are relative to *https://api.aspose.cloud/v3.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*StorageAPI* | [**copyFile**](docs/FileApi.md#copyFile) | **PUT** /html/storage/file/copy/{srcPath} | Copy file
*StorageAPI* | [**deleteFile**](docs/FileApi.md#deleteFile) | **DELETE** /html/storage/file/{path} | Delete file
*StorageAPI* | [**downloadFile**](docs/FileApi.md#downloadFile) | **GET** /html/storage/file/{path} | Download file
*StorageAPI* | [**moveFile**](docs/FileApi.md#moveFile) | **PUT** /html/storage/file/move/{srcPath} | Move file
*StorageAPI* | [**uploadFile**](docs/FileApi.md#uploadFile) | **PUT** /html/storage/file/{path} | Upload file
*StorageAPI* | [**copyFolder**](docs/FolderApi.md#copyFolder) | **PUT** /html/storage/folder/copy/{srcPath} | Copy folder
*StorageAPI* | [**createFolder**](docs/FolderApi.md#createFolder) | **PUT** /html/storage/folder/{path} | Create the folder
*StorageAPI* | [**deleteFolder**](docs/FolderApi.md#deleteFolder) | **DELETE** /html/storage/folder/{path} | Delete folder
*StorageAPI* | [**getFilesList**](docs/FolderApi.md#getFilesList) | **GET** /html/storage/folder/{path} | Get all files and folders within a folder
*StorageAPI* | [**moveFolder**](docs/FolderApi.md#moveFolder) | **PUT** /html/storage/folder/move/{srcPath} | Move folder
*StorageAPI* | [**getDiscUsage**](docs/StorageApi.md#getDiscUsage) | **GET** /html/storage/disc | Get disc usage
*StorageAPI* | [**getFileVersions**](docs/StorageApi.md#getFileVersions) | **GET** /html/storage/version/{path} | Get file versions
*StorageAPI* | [**objectExists**](docs/StorageApi.md#objectExists) | **GET** /html/storage/exist/{path} | Check if file or folder exists
*StorageAPI* | [**storageExists**](docs/StorageApi.md#storageExists) | **GET** /html/storage/{storageName}/exist | Check if storage exists


## Documentation for Models

 - [DiscUsage](docs/DiscUsage.md)
 - [ErrorDetails](docs/ErrorDetails.md)
 - [FilesList](docs/FilesList.md)
 - [FilesUploadResult](docs/FilesUploadResult.md)
 - [FileVersion](docs/FileVersion.md)
 - [FileVersions](docs/FileVersions.md)
 - [ModelError](docs/ModelError.md)
 - [ObjectExist](docs/ObjectExist.md)
 - [StorageExist](docs/StorageExist.md)
 - [StorageFile](docs/StorageFile.md)


[Tests](./Tests/AsposeHtmlTests/) contain various examples of using the Aspose.HTML and Aspose.Storage SDK.
