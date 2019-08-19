# TranslationApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTranslateDocument**](TranslationApi.md#getTranslateDocument) | **GET** /html/{name}/translate/{srcLang}/{resLang} | Translate the HTML document specified by the name from default or specified storage. 
[**getTranslateDocumentByUrl**](TranslationApi.md#getTranslateDocumentByUrl) | **GET** /html/translate/{srcLang}/{resLang} | Translate the HTML document from Web specified by its URL.


<a name="getTranslateDocument"></a>
# **getTranslateDocument**
open class func getTranslateDocument(name: String, srcLang: String, resLang: String, storage: String? = nil, folder: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Translate the HTML document specified by the name from default or specified storage.    
Allowed values for language pairs is en-de, en-fr, en-ru, de-en, ru-en, en-zh, zh-en. 

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Document name. | Html file in the storage.
 **srcLang** | **String**| Source language. | Allowed values is "en" (alias "eng", "english"), "de" (alias "deu", "deutsch", "german"), "fr" (alias "fra", "french"), "ru" (alias "rus", "russian"), "zh", alias ("chinese").
 **resLang** | **String**| Result language. | Allowed values is "en" (alias "eng", "english"), "de" (alias "deu", "deutsch", "german"), "fr" (alias "fra", "french"), "ru" (alias "rus", "russian"), "zh", alias ("chinese").
 **storage** | **String?**| The source document storage. | [optional]
 **folder** | **String?**| The source document folder. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
<a name="getTranslateDocumentByUrl"></a>
# **getTranslateDocumentByUrl**
open class func getTranslateDocumentByUrl(sourceUrl: String, srcLang: String, resLang: String, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Translate the HTML document from Web specified by its URL.    
Allowed values for language pairs is en-de, en-fr, en-ru, de-en, ru-en, en-zh, zh-en.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceUrl** | **String**| Source document URL. |
 **srcLang** | **String**| Source language. | Allowed values is "en" (alias "eng", "english"), "de" (alias "deu", "deutsch", "german"), "fr" (alias "fra", "french"), "ru" (alias "rus", "russian"), "zh", alias ("chinese").
 **resLang** | **String**| Result language. | Allowed values is "en" (alias "eng", "english"), "de" (alias "deu", "deutsch", "german"), "fr" (alias "fra", "french"), "ru" (alias "rus", "russian"), "zh", alias ("chinese").

[[Back to top]](#) [[Back to README]](../README.md)
 
 