# ConversionApi

All URIs are relative to *https://api.aspose.cloud/v4.0*

### Possible conversions:
- HTML -> PDF, XPS, DOCX, MD, MHTML, JPEG, BMP, PNG, TIFF, GIF
- EPUB -> PDF, XPS, DOCX, JPEG, BMP, PNG, TIFF, GIF
- MD -> PDF, XPS, DOCX, HTML, MHTML, JPEG, BMP, PNG, TIFF, GIF
- MHTML -> PDF, XPS, DOCX, JPEG, BMP, PNG, TIFF, GIF
- SVG -> PDF, XPS, JPEG, BMP, PNG, TIFF, GIF
- JPEG, BMP, PNG, TIFF, GIF -> SVG


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
open class func convertLocalToLocal(src: String, dst: String, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Convert a document from a local disk to a local disk.

### Parameters

| Name             | Type                                           | Description                   | Notes      |
|------------------|------------------------------------------------|-------------------------------|------------|
| **src**          | **String**                                     | Full path to the source file. |            |
| **dst**          | **String**                                     | Full path to the result file. |            |
| **options**      | **[Options](Options.md)?**                     | Options for conversion.       | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## convertLocalToStorage
open class func convertLocalToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Convert a document from a local disk to a user's storage.

### Parameters

| Name        | Type                                           | Description                                   | Notes      |
|-------------|------------------------------------------------|-----------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on a local disk. |            |
| **dst**     | **String**                                     | Full path to the result file on a storage.    |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.       | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for conversion.                       | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## convertStorageToLocal
open class func convertStorageToLocal(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Convert a document from a user's storage to a local disk.

### Parameters

| Name        | Type                                           | Description                                     | Notes      |
|-------------|------------------------------------------------|-------------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on user's storage. |            |
| **dst**     | **String**                                     | Full path to the result file on a local disk.   |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.         | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for conversion.                         | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## convertStorageToStorage
open class func convertStorageToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Convert a document from a user's storage to a user's storage.

### Parameters

| Name        | Type                                           | Description                                     | Notes      |
|-------------|------------------------------------------------|-------------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on user's storage. |            |
| **dst**     | **String**                                     | Full path to the result file on a storage.      |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.         | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for conversion.                         | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## convertUrlToLocal
open class func convertUrlToLocal(src: String, dst: String, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Convert website by url to a local disk.

### Parameters

| Name        | Type                                           | Description                                   | Notes      |
|-------------|------------------------------------------------|-----------------------------------------------|------------|
| **src**     | **String**                                     | Url for website.                              |            |
| **dst**     | **String**                                     | Full path to the result file on a local disk. |            |
| **options** | **[Options](Options.md)?**                     | Options for conversion.                       | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## convertUrlToStorage
open class func convertUrlToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Convert website by url to a storage.

### Parameters

| Name        | Type                                           | Description                                       | Notes      |
|-------------|------------------------------------------------|---------------------------------------------------|------------|
| **src**     | **String**                                     | Url for website.                                  |            |
| **dst**     | **String**                                     | Full path to the result file on a user's storage. |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.           | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for conversion.                           | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## Options

### Fields
| Name                | Type         | Description                                                                                                                     | Notes      |
|---------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------|------------|
| **width**           | **Float32?** | Resulting width in pixels for images and in inches for PDF, XPS, DOCX formats.                                                  | [optional] |
| **height**          | **Float32?** | Resulting height in pixels for images and in inches for PDF, XPS, DOCX formats.                                                 | [optional] |
| **leftMargin**      | **Float32?** | Left margin in pixels for images and in inches for PDF, XPS, DOCX formats.                                                      | [optional] |
| **rightMargin**     | **Float32?** | Right margin in pixels for images and in inches for PDF, XPS, DOCX formats.                                                     | [optional] |
| **topMargin**       | **Float32?** | Top margin in pixels for images and in inches for PDF, XPS, DOCX formats.                                                       | [optional] |
| **bottomMargin**    | **Float32?** | Bottom margin in pixels for images and in inches for PDF, XPS, DOCX formats.                                                    | [optional] |
| **jpegquality**     | **Int32?**   | JPEG quality images in percent for PDF output format.                                                                           | [optional] |
| **background**      | **String?**  | CSS background like '#FF0000'. For conversion from SVG only.                                                                    | [optional] |
| **usegit**          | **Bool?**    | For conversion to markdown only. Use git flavor. True or False. Default false.                                                  | [optional] |
| **error_threshold** | **Float32?** | For trace image to SVG. This parameter defines maximum deviation of points to fitted curve. By default it is 30.                | [optional] |
| **max_iterations**  | **Int32?**   | For trace image to SVG. This parameter defines number of iteration for least-squares approximation method. By default it is 30. | [optional] |
| **colors_limit**    | **Int32?**   | For trace image to SVG. The maximum number of colors used to quantize an image. Default value is 25.                            | [optional] |
| **line_width**      | **Float32?** | For trace image to SVG. The value of this parameter is affected by the graphics scale. Default value is 1.                      | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)