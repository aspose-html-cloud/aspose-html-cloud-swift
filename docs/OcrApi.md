# OcrApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getRecognizeAndImportToHtml**](OcrApi.md#getRecognizeAndImportToHtml) | **GET** /html/{name}/ocr/import | Recognize text from the image file in the storage and import it to HTML format.
[**getRecognizeAndTranslateToHtml**](OcrApi.md#getRecognizeAndTranslateToHtml) | **GET** /html/{name}/ocr/translate/{srcLang}/{resLang} | Recognize text from the image file in the storage, import it to HTML format and translate to specified language.

<a name="getRecognizeAndImportToHtml"></a>
# **getRecognizeAndImportToHtml**
open class func getRecognizeAndImportToHtml(name: String, ocrEngineLang: String? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Recognize text from the image file in the storage and import it to HTML format.     
Acceptable image formats is jpg, gif, png, bmp, tiff.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| The image file name. |
 **ocrEngineLang** | **String**| OCR engine language - language  | [optional] [default to en] Allowed va lues is "en", "de", "fr", "ru".
 **folder** | **String?**| The source image folder. | [optional]
 **storage** | **String?**| The source image storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 
<a name="getRecognizeAndTranslateToHtml"></a>
# **getRecognizeAndTranslateToHtml**
open class func getRecognizeAndTranslateToHtml(name: String, srcLang: String, resLang: String, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Recognize text from the image file in the storage, import it to HTML format and translate to specified language.    
Acceptable image formats is jpg, gif, png, bmp, tiff.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| The image file name. |
 **srcLang** | **String**| Source language - also supposed as the OCR engine language. |  Allowed values is "en", "de", "fr", "ru".
 **resLang** | **String**| Result language. |  Allowed values is "en", "de", "fr", "ru".
 **folder** | **String?**| The source image folder. | [optional]
 **storage** | **String?**| The source image storage. | [optional]

[[Back to top]](#) [[Back to README]](../README.md)
 