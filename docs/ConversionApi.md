# ConversionApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getConvertDocumentToImage**](ConversionApi.md#getConvertDocumentToImage) | **GET** /html/{name}/convert/image/{outFormat} | Convert the HTML document from the storage by its name to the specified image format.
[**getConvertDocumentToImageByUrl**](ConversionApi.md#getConvertDocumentToImageByUrl) | **GET** /html/convert/image/{outFormat} | Convert the HTML page from the web by its URL to the specified image format.
[**getConvertDocumentToPdf**](ConversionApi.md#getConvertDocumentToPdf) | **GET** /html/{name}/convert/pdf | Convert the HTML document from the storage by its name to PDF.
[**getConvertDocumentToPdfByUrl**](ConversionApi.md#getConvertDocumentToPdfByUrl) | **GET** /html/convert/pdf | Convert the HTML page from the web by its URL to PDF.
[**getConvertDocumentToXps**](ConversionApi.md#getConvertDocumentToXps) | **GET** /html/{name}/convert/xps | Convert the HTML document from the storage by its name to XPS.
[**getConvertDocumentToXpsByUrl**](ConversionApi.md#getConvertDocumentToXpsByUrl) | **GET** /html/convert/xps | Convert the HTML page from the web by its URL to XPS.
[**postConvertDocumentInRequestToImage**](ConversionApi.md#postConvertDocumentInRequestToImage) | **POST** /html/convert/image/{outFormat} | Converts the HTML document (in request content) to the specified image format and uploads resulting file to storage.
[**postConvertDocumentInRequestToPdf**](ConversionApi.md#postConvertDocumentInRequestToPdf) | **POST** /html/convert/pdf | Converts the HTML document (in request content) to PDF and uploads resulting file to storage.
[**postConvertDocumentInRequestToXps**](ConversionApi.md#postConvertDocumentInRequestToXps) | **POST** /html/convert/xps | Converts the HTML document (in request content) to XPS and uploads resulting file to storage.
[**putConvertDocumentToImage**](ConversionApi.md#putConvertDocumentToImage) | **PUT** /html/{name}/convert/image/{outFormat} | Converts the HTML document (located on storage) to the specified image format and uploads resulting file to storage.
[**putConvertDocumentToPdf**](ConversionApi.md#putConvertDocumentToPdf) | **PUT** /html/{name}/convert/pdf | Converts the HTML document (located on storage) to PDF and uploads resulting file to storage.
[**putConvertDocumentToXps**](ConversionApi.md#putConvertDocumentToXps) | **PUT** /html/{name}/convert/xps | Converts the HTML document (located on storage) to XPS and uploads resulting file to storage.
[**getConvertDocumentToMHTMLByUrl**](ConversionApi.md#getConvertDocumentToMHTMLByUrl) | **GET** /html/convert/mhtml | Converts the HTML page from Web by its URL to MHTML returns resulting file in response content.
[**getConvertDocumentToMarkdown**](ConversionApi.md#getConvertDocumentToMarkdown) | **GET** /html/{name}/convert/md | Converts the HTML document (located on storage) to Markdown and returns resulting file in response content.
[**postConvertDocumentInRequestToMarkdown**](ConversionApi.md#postConvertDocumentInRequestToMarkdown) | **POST** /html/convert/md | Converts the HTML document (in request content) to Markdown and uploads resulting file to storage by specified path.
[**putConvertDocumentToMarkdown**](ConversionApi.md#putConvertDocumentToMarkdown) | **PUT** /html/{name}/convert/md | Converts the HTML document (located on storage) to Markdown and uploads resulting file to storage by specified path.


<a name="getConvertDocumentToImage"></a>
# **getConvertDocumentToImage**
open class func getConvertDocumentToImage(name: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Convert the HTML document from the storage by its name to the specified image format.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | html, epub, svg formats
 **outFormat** | **String**| Resulting image format. | jpeg, png, bmp, tiff, gif
 **width** | **Int?**| Resulting image width in points (1/96 inch). | [optional] 
 **height** | **Int?**| Resulting image height in points (1/96 inch). | [optional] 
 **leftMargin** | **Int?**| Left resulting image margin in points (1/96 inch). | [optional] 
 **rightMargin** | **Int?**| Right resulting image margin in points (1/96 inch). | [optional] 
 **topMargin** | **Int?**| Top resulting image margin in points (1/96 inch). | [optional] 
 **bottomMargin** | **Int?**| Bottom resulting image margin in points (1/96 inch). | [optional] 
 **resolution** | **Int?**| Resolution of resulting image. Default is 96 dpi. | [optional] 
 **folder** | **String?**| The source document folder. | [optional] 
 **storage** | **String?**| The source document storage. | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getConvertDocumentToImageByUrl"></a>
# **getConvertDocumentToImageByUrl**
open class func getConvertDocumentToImageByUrl(sourceUrl: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Convert the HTML page from the web by its URL to the specified image format.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Url address. | 
 **outFormat** | **String**| Resulting image format. | jpeg, png, bmp, tiff, gif
 **width** | **Int?**| Resulting image width in points (1/96 inch). | [optional] 
 **height** | **Int?**| Resulting image height in points (1/96 inch). | [optional] 
 **leftMargin** | **Int?**| Left resulting image margin in points (1/96 inch). | [optional] 
 **rightMargin** | **Int?**| Right resulting image margin in points (1/96 inch). | [optional] 
 **topMargin** | **Int?**| Top resulting image margin in points (1/96 inch). | [optional] 
 **bottomMargin** | **Int?**| Bottom resulting image margin in points (1/96 inch). | [optional] 
 **resolution** | **Int?**| Resolution of resulting image. Default is 96 dpi. | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getConvertDocumentToPdf"></a>
# **getConvertDocumentToPdf**
open class func getConvertDocumentToPdf(name: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Convert the HTML document from the storage by its name to PDF.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | html, epub, svg formats
 **width** | **Int?**| Resulting image width in points (1/96 inch). | [optional] 
 **height** | **Int?**| Resulting image height in points (1/96 inch). | [optional] 
 **leftMargin** | **Int?**| Left resulting image margin in points (1/96 inch). | [optional] 
 **rightMargin** | **Int?**| Right resulting image margin in points (1/96 inch). | [optional] 
 **topMargin** | **Int?**| Top resulting image margin in points (1/96 inch). | [optional] 
 **bottomMargin** | **Int?**| Bottom resulting image margin in points (1/96 inch). | [optional] 
 **folder** | **String?**| The source document folder. | [optional] 
 **storage** | **String?**| The source document storage. | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getConvertDocumentToPdfByUrl"></a>
# **getConvertDocumentToPdfByUrl**
open class func getConvertDocumentToPdfByUrl(sourceUrl: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Convert the HTML page from the web by its URL to PDF.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Url address. | 
 **width** | **Int?**| Resulting image width in points (1/96 inch). | [optional] 
 **height** | **Int?**| Resulting image height in points (1/96 inch). | [optional] 
 **leftMargin** | **Int?**| Left resulting image margin in points (1/96 inch). | [optional] 
 **rightMargin** | **Int?**| Right resulting image margin in points (1/96 inch). | [optional] 
 **topMargin** | **Int?**| Top resulting image margin in points (1/96 inch). | [optional] 
 **bottomMargin** | **Int?**| Bottom resulting image margin in points (1/96 inch). | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getConvertDocumentToXps"></a>
# **getConvertDocumentToXps**
open class func getConvertDocumentToXps(name: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Convert the HTML document from the storage by its name to XPS.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | html, epub, svg formats
 **width** | **Int?**| Resulting image width in points (1/96 inch). | [optional] 
 **height** | **Int?**| Resulting image height in points (1/96 inch). | [optional] 
 **leftMargin** | **Int?**| Left resulting image margin in points (1/96 inch). | [optional] 
 **rightMargin** | **Int?**| Right resulting image margin in points (1/96 inch). | [optional] 
 **topMargin** | **Int?**| Top resulting image margin in points (1/96 inch). | [optional] 
 **bottomMargin** | **Int?**| Bottom resulting image margin in points (1/96 inch). | [optional] 
 **folder** | **String?**| The source document folder. | [optional] 
 **storage** | **String?**| The source document storage. | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getConvertDocumentToXpsByUrl"></a>
# **getConvertDocumentToXpsByUrl**
open class func getConvertDocumentToXpsByUrl(sourceUrl: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Convert the HTML page from the web by its URL to XPS.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Url address. | 
 **width** | **Int?**| Resulting image width in points (1/96 inch). | [optional] 
 **height** | **Int?**| Resulting image height in points (1/96 inch). | [optional] 
 **leftMargin** | **Int?**| Left resulting image margin in points (1/96 inch). | [optional] 
 **rightMargin** | **Int?**| Right resulting image margin in points (1/96 inch). | [optional] 
 **topMargin** | **Int?**| Top resulting image margin in points (1/96 inch). | [optional] 
 **bottomMargin** | **Int?**| Bottom resulting image margin in points (1/96 inch). | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="postConvertDocumentInRequestToImage"></a>
# **postConvertDocumentInRequestToImage**
open class func postConvertDocumentInRequestToImage(outPath: String, outFormat: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Converts the HTML document (in request content) to the specified image format and uploads resulting file to storage.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **outPath** | **String**| Full resulting filename (ex. /folder1/folder2/result.jpg) |
 **outFormat** | **String**|  | jpeg, png, bmp, tiff, gif
 **file** | **URL**| A file to be converted. | html, epub, svg formats
 **width** | **Int?**| Resulting document page width in points (1/96 inch). | [optional]
 **height** | **Int?**| Resulting document page height in points (1/96 inch). | [optional]
 **leftMargin** | **Int?**| Left resulting document page margin in points (1/96 inch). | [optional]
 **rightMargin** | **Int?**| Right resulting document page margin in points (1/96 inch). | [optional]
 **topMargin** | **Int?**| Top resulting document page margin in points (1/96 inch). | [optional]
 **bottomMargin** | **Int?**| Bottom resulting document page margin in points (1/96 inch). | [optional]
 **resolution** | **Int?**| Resolution of resulting image. Default is 96 dpi. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="postConvertDocumentInRequestToPdf"></a>
# **postConvertDocumentInRequestToPdf**
open class func postConvertDocumentInRequestToPdf(outPath: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Converts the HTML document (in request content) to PDF and uploads resulting file to storage.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **outPath** | **String**| Full resulting filename (ex. /folder1/folder2/result.pdf) |
 **file** | **URL**| A file to be converted. | html, epub, svg formats
 **width** | **Int?**| Resulting document page width in points (1/96 inch). | [optional]
 **height** | **Int?**| Resulting document page height in points (1/96 inch). | [optional]
 **leftMargin** | **Int?**| Left resulting document page margin in points (1/96 inch). | [optional]
 **rightMargin** | **Int?**| Right resulting document page margin in points (1/96 inch). | [optional]
 **topMargin** | **Int?**| Top resulting document page margin in points (1/96 inch). | [optional]
 **bottomMargin** | **Int?**| Bottom resulting document page margin in points (1/96 inch). | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="postConvertDocumentInRequestToXps"></a>
# **postConvertDocumentInRequestToXps**
open class func postConvertDocumentInRequestToXps(outPath: String, file: URL, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Converts the HTML document (in request content) to XPS and uploads resulting file to storage.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **outPath** | **String**| Full resulting filename (ex. /folder1/folder2/result.pdf) |
 **file** | **URL**| A file to be converted. | html, epub, svg formats
 **width** | **Int?**| Resulting document page width in points (1/96 inch). | [optional]
 **height** | **Int?**| Resulting document page height in points (1/96 inch). | [optional]
 **leftMargin** | **Int?**| Left resulting document page margin in points (1/96 inch). | [optional]
 **rightMargin** | **Int?**| Right resulting document page margin in points (1/96 inch). | [optional]
 **topMargin** | **Int?**| Top resulting document page margin in points (1/96 inch). | [optional]
 **bottomMargin** | **Int?**| Bottom resulting document page margin in points (1/96 inch). | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="putConvertDocumentToImage"></a>
# **putConvertDocumentToImage**
open class func putConvertDocumentToImage(name: String, outPath: String, outFormat: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, resolution: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Converts the HTML document (located on storage) to the specified image format and uploads resulting file to storage.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | html, epub, svg formats
 **outPath** | **String**| Full resulting filename (ex. /folder1/folder2/result.jpg) |
 **outFormat** | **String**|  | jpeg, png, bmp, tiff, gif
 **width** | **Int?**| Resulting document page width in points (1/96 inch). | [optional]
 **height** | **Int?**| Resulting document page height in points (1/96 inch). | [optional]
 **leftMargin** | **Int?**| Left resulting document page margin in points (1/96 inch). | [optional]
 **rightMargin** | **Int?**| Right resulting document page margin in points (1/96 inch). | [optional]
 **topMargin** | **Int?**| Top resulting document page margin in points (1/96 inch). | [optional]
 **bottomMargin** | **Int?**| Bottom resulting document page margin in points (1/96 inch). | [optional]
 **resolution** | **Int?**| Resolution of resulting image. Default is 96 dpi. | [optional]
 **folder** | **String?**| The source document folder. | [optional]
 **storage** | **String?**| The source and resulting document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="putConvertDocumentToPdf"></a>
# **putConvertDocumentToPdf**
open class func putConvertDocumentToPdf(name: String, outPath: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Converts the HTML document (located on storage) to PDF and uploads resulting file to storage.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | html, epub, svg formats
 **outPath** | **String**| Full resulting filename (ex. /folder1/folder2/result.pdf) |
 **width** | **Int?**| Resulting document page width in points (1/96 inch). | [optional]
 **height** | **Int?**| Resulting document page height in points (1/96 inch). | [optional]
 **leftMargin** | **Int?**| Left resulting document page margin in points (1/96 inch). | [optional]
 **rightMargin** | **Int?**| Right resulting document page margin in points (1/96 inch). | [optional]
 **topMargin** | **Int?**| Top resulting document page margin in points (1/96 inch). | [optional]
 **bottomMargin** | **Int?**| Bottom resulting document page margin in points (1/96 inch). | [optional]
 **folder** | **String?**| The source document folder. | [optional]
 **storage** | **String?**| The source and resulting document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="putConvertDocumentToXps"></a>
# **putConvertDocumentToXps**
open class func putConvertDocumentToXps(name: String, outPath: String, width: Int? = nil, height: Int? = nil, leftMargin: Int? = nil, rightMargin: Int? = nil, topMargin: Int? = nil, bottomMargin: Int? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Converts the HTML document (located on storage) to XPS and uploads resulting file to storage.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | html, epub, svg formats
 **outPath** | **String**| Full resulting filename (ex. /folder1/folder2/result.xps) |
 **width** | **Int?**| Resulting document page width in points (1/96 inch). | [optional]
 **height** | **Int?**| Resulting document page height in points (1/96 inch). | [optional]
 **leftMargin** | **Int?**| Left resulting document page margin in points (1/96 inch). | [optional]
 **rightMargin** | **Int?**| Right resulting document page margin in points (1/96 inch). | [optional]
 **topMargin** | **Int?**| Top resulting document page margin in points (1/96 inch). | [optional]
 **bottomMargin** | **Int?**| Bottom resulting document page margin in points (1/96 inch). | [optional]
 **folder** | **String?**| The source document folder. | [optional]
 **storage** | **String?**| The source and resulting document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)


<a name="getConvertDocumentToMHTMLByUrl"></a>
# **getConvertDocumentToMHTMLByUrl**
public class func getConvertDocumentToMHTMLByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the HTML page from Web by its URL to MHTML returns resulting file in response content.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Url address. |

[[Back to top]](#) [[Back to README]](../README.md)


<a name="getConvertDocumentToMarkdown"></a>
# **getConvertDocumentToMarkdown**
public class func getConvertDocumentToMarkdown(name: String, useGit: String? = "false", folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the HTML document (located on storage) to Markdown and returns resulting file in response content.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. |
 **useGit** | **String?**| Use Git Markdown flavor to save ("true"/"false"). | [optional] [default to "false"]
 **folder** | **String?**| Source document folder. | [optional]
 **storage** | **String?**| Source document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)


<a name="postConvertDocumentInRequestToMarkdown"></a>
# **postConvertDocumentInRequestToMarkdown**
public class func postConvertDocumentInRequestToMarkdown(outPath: String, file: URL, useGit: String? = "false", storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the HTML document (in request content) to Markdown and uploads resulting file to storage by specified path.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **outPath** | **String**| Full resulting file path in the storage (ex. /folder1/folder2/result.md) |
 **file** | **URL**| A file to be converted. |
 **useGit** | **String?**| Use Git Markdown flavor to save ("true"/"false"). | [optional] [default to "false"]
 **storage** | **String?**| The document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)


<a name="putConvertDocumentToMarkdown"></a>
# **putConvertDocumentToMarkdown**
public class func putConvertDocumentToMarkdown(name: String, outPath: String, useGit: String? = "false", folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the HTML document (located on storage) to Markdown and uploads resulting file to storage by specified path.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. |
 **outPath** | **String**| Full resulting file path in the storage (ex. /folder1/folder2/result.md) |
 **useGit** | **String?**| Use Git Markdown flavor to save ("true"/"false"). | [optional] [default to "false"]
 **folder** | **String?**| The source document folder. | [optional]
 **storage** | **String?**| The source and resulting document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
