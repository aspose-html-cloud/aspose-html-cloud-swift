# ImportApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getConvertMarkdownToHtml**](ImportApi.md#getConvertMarkdownToHtml) | **GET** /html/{name}/import/md | Converts the Markdown document (located on storage) to HTML and returns resulting file in response content.
[**postConvertMarkdownInRequestToHtml**](ImportApi.md#postConvertMarkdownInRequestToHtml) | **POST** /html/import/md | Converts the Markdown document (in request content) to HTML and uploads resulting file to storage by specified path.
[**putConvertMarkdownToHtml**](ImportApi.md#putConvertMarkdownToHtml) | **PUT** /html/{name}/import/md | Converts the Markdown document (located on storage) to HTML and uploads resulting file to storage by specified path.

<a name="getConvertMarkdownToHtml"></a>
# **getConvertMarkdownToHtml**
public class func getConvertMarkdownToHtml(name: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the Markdown document (located on storage) to HTML and returns resulting file in response content.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. |
 **folder** | **String?**| Source document folder. | [optional]
 **storage** | **String?**| Source document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)


<a name="postConvertMarkdownInRequestToHtml"></a>
# **postConvertMarkdownInRequestToHtml**
public class func postConvertMarkdownInRequestToHtml(outPath: String, file: URL, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the HTML document (in request content) to Markdown and uploads resulting file to storage by specified path.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **outPath** | **String**| Full resulting file path in the storage (ex. /folder1/folder2/result.html) |
 **file** | **URL**| A file to be converted. |
 **storage** | **String?**| The document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)


<a name="putConvertMarkdownToHtml"></a>
# **putConvertMarkdownToHtml**
public class func putConvertMarkdownToHtml(name: String, outPath: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Converts the Markdown document (located on storage) to HTML and uploads resulting file to storage by specified path.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. |
 **outPath** | **String**| Full resulting file path in the storage (ex. /folder1/folder2/result.html) |
 **folder** | **String?**| The source document folder. | [optional]
 **storage** | **String?**| The source and resulting document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
