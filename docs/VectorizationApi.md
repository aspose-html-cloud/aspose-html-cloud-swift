# VectorizationApi

All URIs are relative to *https://api.aspose.cloud/v4.0*

### Possible vectorization:
- JPEG, BMP, PNG, TIFF, GIF -> SVG


| Class     | Method                                                                         | Description                                                                 |
|-----------|--------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| *HtmlAPI* | [**vectorizeLocalToLocal**](VectorizationApi.md#vectorizelocaltolocal)         | Vectorize an image to the SVG format from a local disk to a local disk.     |
| *HtmlAPI* | [**vectorizeLocalToStorage**](VectorizationApi.md#vectorizelocaltostorage)     | Vectorize an image to the SVG format from a local disk to user's storage.   |
| *HtmlAPI* | [**vectorizeStorageToLocal**](VectorizationApi.md#vectorizestoragetolocal)     | Vectorize an image to the SVG format from user's storage to a local disk.   |
| *HtmlAPI* | [**vectorizeStorageToStorage**](VectorizationApi.md#vectorizestoragetostorage) | Vectorize an image to the SVG format from user's storage to user's storage. |
| *HtmlAPI* | [**vectorize**](VectorizationApi.md#vectorize)                                 | Vectorize an image to the SVG format.                                       |

## vectorizeLocalToLocal
open class func vectorizeLocalToLocal(src: String, dst: String, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Vectorize an image to the SVG format from a local disk to a local disk.

### Parameters

| Name             | Type                                           | Description                   | Notes      |
|------------------|------------------------------------------------|-------------------------------|------------|
| **src**          | **String**                                     | Full path to the source file. |            |
| **dst**          | **String**                                     | Full path to the result file. |            |
| **options**      | **[Options](Options.md)?**                     | Options for vectorization.    | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)


## vectorizeLocalToStorage
open class func vectorizeLocalToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Vectorize an image to the SVG format from a local disk to a user's storage.

### Parameters

| Name        | Type                                           | Description                                   | Notes      |
|-------------|------------------------------------------------|-----------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on a local disk. |            |
| **dst**     | **String**                                     | Full path to the result file on a storage.    |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.       | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for vectorization.                    | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## vectorizeStorageToLocal
open class func vectorizeStorageToLocal(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Vectorize an image to the SVG format from a user's storage to a local disk.

### Parameters

| Name        | Type                                           | Description                                     | Notes      |
|-------------|------------------------------------------------|-------------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on user's storage. |            |
| **dst**     | **String**                                     | Full path to the result file on a local disk.   |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.         | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for vectorization.                      | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## vectorizeStorageToStorage
open class func vectorizeStorageToStorage(src: String, dst: String, storage: String?, options: Options? = nil, completion: @escaping ((_ data: OperationResult?,_ error: Error?) -> Void))

Vectorize an image to the SVG format from a user's storage to a user's storage.

### Parameters

| Name        | Type                                           | Description                                     | Notes      |
|-------------|------------------------------------------------|-------------------------------------------------|------------|
| **src**     | **String**                                     | Full path to the source file on user's storage. |            |
| **dst**     | **String**                                     | Full path to the result file on a storage.      |            |
| **storage** | **String?**                                    | User's storage. Default storage is nil.         | [optional] |
| **options** | **[Options](Options.md)?**                     | Options for vectorization.                      | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)

## Options

### Fields
| Name                | Type         | Description                                                                                                                     | Notes      |
|---------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------|------------|
| **error_threshold** | **Float32?** | For trace image to SVG. This parameter defines maximum deviation of points to fitted curve. By default it is 30.                | [optional] |
| **max_iterations**  | **Int32?**   | For trace image to SVG. This parameter defines number of iteration for least-squares approximation method. By default it is 30. | [optional] |
| **colors_limit**    | **Int32?**   | For trace image to SVG. The maximum number of colors used to quantize an image. Default value is 25.                            | [optional] |
| **line_width**      | **Float32?** | For trace image to SVG. The value of this parameter is affected by the graphics scale. Default value is 1.                      | [optional] |

[[Back to top]](#) [[Back to README]](../README.md)
