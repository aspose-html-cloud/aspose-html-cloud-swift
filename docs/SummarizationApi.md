# SummarizationApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDetectHtmlKeywords**](SummarizationApi.md#getDetectHtmlKeywords) | **GET** /html/{name}/summ/keywords | Get the HTML document keywords using the keyword detection service.
[**getDetectHtmlKeywordsByUrl**](SummarizationApi.md#getDetectHtmlKeywordsByUrl) | **GET** /html/summ/keywords | Get the keywords from HTML document from Web specified by its URL using the keyword detection service


<a name="getDetectHtmlKeywords"></a>
# **getDetectHtmlKeywords**
open class func getDetectHtmlKeywords(name: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Get the HTML document keywords using the keyword detection service.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | Html file in the storage.
 **folder** | **String?**| Document folder. | [optional]
 **storage** | **String?**| Document storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
<a name="getDetectHtmlKeywordsByUrl"></a>
# **getDetectHtmlKeywordsByUrl**
open class func getDetectHtmlKeywordsByUrl(sourceUrl: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Get the keywords from HTML document from Web specified by its URL using the keyword detection service

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Source document URL. |

[[Back to top]](#) [[Back to README]](../README.md)
 