# SeoApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSeoWarning**](SeoApi.md#getSeoWarning) | **GET** /html/seo | Page analysis and return SEO warnings in json format.
[**getHtmlWarning**](SeoApi.md#getHtmlWarning) | **GET** /html/validator | Checks the markup validity of Web documents in HTML, XHTML, etc.and return in json format.


<a name="getSeoWarning"></a>
# **getSeoWarning**
public class func getSeoWarning(addr: String, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Page analysis and return SEO warnings in json format.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addr** | **String**| Source url. | 

[[Back to top]](#) [[Back to README]](../README.md)


<a name="getHtmlWarning"></a>
# **getHtmlWarning**
public class func getHtmlWarning(url: String, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void))

Checks the markup validity of Web documents in HTML, XHTML, etc.and return in json format.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **url** | **String**| Source url. | 

[[Back to top]](#) [[Back to README]](../README.md)

