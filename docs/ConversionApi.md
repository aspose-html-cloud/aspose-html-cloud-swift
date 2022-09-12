# ConversionApi

All URIs are relative to *https://api.aspose.cloud/v4.0*


| Class     | Method                                                                  | Description                                                              |
|-----------|-------------------------------------------------------------------------|--------------------------------------------------------------------------|
| *HtmlAPI* | [**convertLocalToLocal**](ConversionApi.md#convertlocaltolocal)         | Convert the HTML or EPUB document from a local disk to a local disk.     |
| *HtmlAPI* | [**convertLocalToStorage**](ConversionApi.md#convertlocaltostorage)     | Convert the HTML or EPUB document from a local disk to user's storage.   |
| *HtmlAPI* | [**convertStorageToLocal**](ConversionApi.md#convertstoragetolocal)     | Convert the HTML or EPUB document from user's storage to a local disk.   |
| *HtmlAPI* | [**convertStorageToStorage**](ConversionApi.md#convertstoragetostorage) | Convert the HTML or EPUB document from user's storage to user's storage. |
| *HtmlAPI* | [**convertUrlToLocal**](ConversionApi.md#converturltolocal)             | Convert the HTML document by URL to a local disk.                        |
| *HtmlAPI* | [**convertUrlToStorage**](ConversionApi.md#converturltostorage)         | Convert the HTML document by URL to user's storage.                      |
| *HtmlAPI* | [**convert**](ConversionApi.md#convert)                                 | Convert the HTML, EPUB or URL to the specified format.                   |


## convertLocalToLocal
open class func convertLocalToLocal(src: String, dst: String, options: ConversionOptions? = nil, completion: @escaping ((_ data: ConversionResult?,_ error: Error?) -> Void))

Convert the HTML or EPUB document from a local disk to a local disk.

### Parameters

| Name             | Type                                           | Description                   | Notes      |
|------------------|------------------------------------------------|-------------------------------|------------|
| **src**          | **String**                                     | Full path to the source file. |            |
| **dst**          | **String**                                     | Full path to the result file. |            |
| **options**      | **[ConversionOptions](ConversionOptions.md)?** | Options for conversion.       | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## convertLocalToStorage
open class func convertLocalToStorage(src: String, dst: String, storage: String?, options: ConversionOptions? = nil, completion: @escaping ((_ data: ConversionResult?,_ error: Error?) -> Void))

Convert the HTML or EPUB document from a local disk to a user's storage.

### Parameters

| Name        | Type                                           | Description                                   | Notes      |
|-------------|------------------------------------------------|-----------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on a local disk. |            |
| **dst**     | **String**                                     | Full path to the result file on a storage.    |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.       | [optional] |
| **options** | **[ConversionOptions](ConversionOptions.md)?** | Options for conversion.                       | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## convertStorageToLocal
open class func convertStorageToLocal(src: String, dst: String, storage: String?, options: ConversionOptions? = nil, completion: @escaping ((_ data: ConversionResult?,_ error: Error?) -> Void))

Convert the HTML or EPUB document from a user's storage to a local disk.

### Parameters

| Name        | Type                                           | Description                                     | Notes      |
|-------------|------------------------------------------------|-------------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on user's storage. |            |
| **dst**     | **String**                                     | Full path to the result file on a local disk.   |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.         | [optional] |
| **options** | **[ConversionOptions](ConversionOptions.md)?** | Options for conversion.                         | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## convertStorageToStorage
open class func convertStorageToStorage(src: String, dst: String, storage: String?, options: ConversionOptions? = nil, completion: @escaping ((_ data: ConversionResult?,_ error: Error?) -> Void))

Convert the HTML or EPUB document from a user's storage to a user's storage.

### Parameters

| Name        | Type                                           | Description                                     | Notes      |
|-------------|------------------------------------------------|-------------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on user's storage. |            |
| **dst**     | **String**                                     | Full path to the result file on a storage.      |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.         | [optional] |
| **options** | **[ConversionOptions](ConversionOptions.md)?** | Options for conversion.                         | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## convertUrlToLocal
open class func convertUrlToLocal(src: String, dst: String, options: ConversionOptions? = nil, completion: @escaping ((_ data: ConversionResult?,_ error: Error?) -> Void))

Convert website by url to a local disk.

### Parameters

| Name        | Type                                           | Description                                   | Notes      |
|-------------|------------------------------------------------|-----------------------------------------------|------------|
| **src**     | **String**                                     | Url for website.                              |            |
| **dst**     | **String**                                     | Full path to the result file on a local disk. |            |
| **options** | **[ConversionOptions](ConversionOptions.md)?** | Options for conversion.                       | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## convertUrlToStorage
open class func convertUrlToStorage(src: String, dst: String, storage: String?, options: ConversionOptions? = nil, completion: @escaping ((_ data: ConversionResult?,_ error: Error?) -> Void))

Convert website by url to a storage.

### Parameters

| Name        | Type                                           | Description                                       | Notes      |
|-------------|------------------------------------------------|---------------------------------------------------|------------|
| **src**     | **String**                                     | Url for website.                                  |            |
| **dst**     | **String**                                     | Full path to the result file on a user's storage. |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.           | [optional] |
| **options** | **[ConversionOptions](ConversionOptions.md)?** | Options for conversion.                           | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

