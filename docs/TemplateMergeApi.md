# TemplateMergeApi

All URIs are relative to *https://api.aspose.cloud/v3.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMergeHtmlTemplate**](TemplateMergeApi.md#getMergeHtmlTemplate) | **GET** /html/{templateName}/merge | Populate HTML document template with data located as a file in the storage.
[**postMergeHtmlTemplate**](TemplateMergeApi.md#postMergeHtmlTemplate) | **POST** /html/{templateName}/merge | Populate HTML document template with data from the request body. Result document will be saved to storage.


<a name="getMergeHtmlTemplate"></a>
# **getMergeHtmlTemplate**
> open class func getMergeHtmlTemplate(templateName: String, dataPath: String, options: String? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Populate HTML document template with data located as a file in the storage.


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateName** | **String**| Template document name. Template document is HTML or zipped HTML. | 
 **dataPath** | **String**| Data source file path in the storage. Supported data format: XML | 
 **options** | **String**| Template merge options: reserved for further implementation. | [optional] 
 **folder** | **String**| The template document folder. | [optional] 
 **storage** | **String**| The template document and data source storage. | [optional] 

### HTTP request headers

 - **Content-Type**: application/octet-stream
 - **Accept**: application/json

<a name="PostMergeHtmlTemplate"></a>
# **PostMergeHtmlTemplate**
> open class func postMergeHtmlTemplate(templateName: String, outPath: String, file: URL, options: String? = nil, folder: String? = nil, storage: String? = nil, completion: @escaping ((_ data: Data?,_ error: Error?) -> Void))

Populate HTML document template with data from the request body. Result document will be saved to storage.

### Example

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateName** | **String**| Template document name. Template document is HTML or zipped HTML. | 
 **outPath** | **String**| Result document path. | 
 **file** | **File**| A data file to populate template. | 
 **options** | **String**| Template merge options: reserved for further implementation. | [optional] 
 **folder** | **String**| The template document folder. | [optional] 
 **storage** | **String**| The template document and data source storage. | [optional] 


### HTTP request headers

 - **Content-Type**: application/octet-stream
 - **Accept**: application/json


### Example

#### Template file HtmlTemplate.html

```html
<html>
     <head>
          <title>{{Title}}</title>
          <meta charset="utf-8" />
     </head>
     <body>
          <div>
               <p>Name: {{Name}} {{Surname}}</p>
               <p>Address: {{Address.Number}}, {{Address.Street}}, {{Address.City}}</p>
          </div>
      </body>
</html>
```

#### Data file XmlSourceData.xml
```xml
<?xml version="1.0" encoding="utf-8" ?>
<Data>
	<Title>Test</Title>
	<Person>
		<Name>John</Name>
		<Surname>Smith</Surname>
		<Address>
			<Number>200</Number>
			<Street>Austin rd.</Street>
			<City>Dallas</City>
		</Address>
	</Person>
	<Person>
		<Name>Jack</Name>
		<Surname>Fox</Surname>
		<Address>
			<Number>25</Number>
			<Street>Broadway</Street>
			<City>New York</City>
		</Address>
	</Person>
	<Person>
		<Name>Sherlock</Name>
		<Surname>Holmes</Surname>
		<Address>
			<Number>65</Number>
			<Street>Baker str.</Street>
			<City>London</City>
		</Address>
	</Person>
</Data>
```
