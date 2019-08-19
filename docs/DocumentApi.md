# DocumentApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDocumentByUrl**](DocumentApi.md#getDocumentByUrl) | **GET** /html/download | Return all HTML page with linked resources packaged as a ZIP archive by the source page URL.
[**getDocumentFragmentByXPath**](DocumentApi.md#getDocumentFragmentByXPath) | **GET** /html/{name}/fragments/{outFormat} | Return list of HTML fragments matching the specified XPath query. 
[**getDocumentFragmentByXPathByUrl**](DocumentApi.md#getDocumentFragmentByXPathByUrl) | **GET** /html/fragments/{outFormat} | Return list of HTML fragments matching the specified XPath query by the source page URL.
[**getDocumentFragmentsByCSSSelector**](DocumentApi.md#getDocumentFragmentsByCSSSelector) | **GET** /html/{name}/fragments/css/{outFormat} | Return list of HTML fragments matching the specified CSS selector.
[**getDocumentFragmentsByCSSSelectorByUrl**](DocumentApi.md#getDocumentFragmentsByCSSSelectorByUrl) | **GET** /html/fragments/css/{outFormat} | Return list of HTML fragments matching the specified CSS selector by the source page URL.
[**getDocumentImages**](DocumentApi.md#getDocumentImages) | **GET** /html/{name}/images/all | Return all HTML document images packaged as a ZIP archive.
[**getDocumentImagesByUrl**](DocumentApi.md#getDocumentImagesByUrl) | **GET** /html/images/all | Return all HTML page images packaged as a ZIP archive by the source page URL.

<a name="getDocumentByUrl"></a>
# **getDocumentByUrl**
open class func getDocumentByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Return all HTML page with linked resources packaged as a ZIP archive by the source page URL.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Source page URL. |

[[Back to top]](#) [[Back to README]](../README.md)

 
<a name="documentGetDocumentFragmentByXPath"></a>
# **getDocumentFragmentByXPath**
open class func getDocumentFragmentByXPath(name: String, xPath: String, outFormat: String, storage: String? = nil, folder: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Return list of HTML fragments matching the specified XPath query. 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| The document name. | Presented as zip archive with one html file in the root or html file.
 **xPath** | **String**| XPath query string. |
 **outFormat** | **String**| Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. |
 **storage** | **String?**| The document storage. | [optional]
 **folder** | **String?**| The document folder. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getDocumentFragmentByXPathByUrl"></a>
# **getDocumentFragmentByXPathByUrl**
open class func getDocumentFragmentByXPathByUrl(sourceUrl: String, xPath: String, outFormat: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Return list of HTML fragments matching the specified XPath query by the source page URL.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Source page URL. |
 **xPath** | **String**| XPath query string. |
 **outFormat** | **String**| Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. |

[[Back to top]](#) [[Back to README]](../README.md)


<a name="getDocumentFragmentsByCSSSelector"></a>
# **getDocumentFragmentsByCSSSelector**
open class func getDocumentFragmentsByCSSSelector(name: String, selector: String, outFormat: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))   


Return list of HTML fragments matching the specified CSS selector.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| The document name. | Presented as zip archive with one html file in the root or html file.
 **selector** | **String**| CSS selector string. | 
 **outFormat** | **String**| Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. | 
 **folder** | **String?**| The document folder. | [optional] 
 **storage** | **String?**| The document storage. | [optional] 

[[Back to top]](#) [[Back to README]](../README.md)


<a name="getDocumentFragmentsByCSSSelectorByUrl"></a>
# **getDocumentFragmentsByCSSSelectorByUrl**
open class func getDocumentFragmentsByCSSSelectorByUrl(sourceUrl: String, selector: String, outFormat: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))   

Return list of HTML fragments matching the specified CSS selector by the source page URL.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Source page URL. | 
 **selector** | **String**| CSS selector string. | 
 **outFormat** | **String**| Output format. Possible values: &#39;plain&#39; and &#39;json&#39;. | 

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getDocumentImages"></a>
# **getDocumentImages**
open class func getDocumentImages(name: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Return all HTML document images packaged as a ZIP archive.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| The document name. | Presented as zip archive with one html file in the root.
 **folder** | **String?**| The document folder. | [optional]
 **storage** | **String?**| The document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)

<a name="getDocumentImagesByUrl"></a>
# **getDocumentImagesByUrl**
open class func getDocumentImagesByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))
Return all HTML page images packaged as a ZIP archive by the source page URL.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Source page URL. |

[[Back to top]](#) [[Back to README]](../README.md)
