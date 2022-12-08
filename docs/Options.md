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
