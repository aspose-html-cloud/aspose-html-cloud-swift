/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="Options.swift">
 *  Copyright (c) 2022 Aspose.HTML for Cloud
 * </copyright>
 * <summary>
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 * </summary>
 * --------------------------------------------------------------------------------------------------------------------
 */

import Foundation

/** File or folder information */
public struct Options: Codable {


    /** Width in pixels for images and inches for PDF, XPS, DOCX formats. */
    public var width: Float32?

    /** Height in pixels and inches for PDF, XPS, DOCX formats.  */
    public var height: Float32?
    
    /** Left margin in pixels and inches for PDF, XPS, DOCX formats.  */
    public var leftMargin: Float32?
    
    /** Right margin in pixels and inches for PDF, XPS, DOCX formats.  */
    public var rightMargin: Float32?

    /** Top margin in pixels and inches for PDF, XPS, DOCX formats.  */
    public var topMargin: Float32?

    /** Bottom margin in pixels and inches for PDF, XPS, DOCX formats.  */
    public var bottomMargin: Float32?
    
    /** CSS background like '#FF0000'. For conversion from SVG only.  */
    public var background: String?

    /** For conversion to markdown only. Use git flavor. True or False. Default false.  */
    public var usegit: Bool?
    
    /** For trace image to SVG. This parameter defines maximum deviation of points to fitted curve. By default it is 30.  */
    public var error_threshold: Float32?
    
    /** For trace image to SVG. This parameter defines number of iteration for least-squares approximation method. By default it is 30.  */
    public var max_iterations: Int32?
    
    /** For trace image to SVG. The maximum number of colors used to quantize an image. Default value is 25. */
    public var colors_limit: Int32?
    
    /** For trace image to SVG. The value of this parameter is affected by the graphics scale. Default value is 1.   */
    public var line_width: Float32?

    public init(width: Float32? = nil,
                height: Float32? = nil,
                leftMargin: Float32? = nil,
                rightMargin: Float32? = nil,
                topMargin: Float32? = nil,
                bottomMargin: Float32? = nil,
                background: String? = nil,
                error_threshold: Float32? = nil,
                max_iterations: Int32? = nil,
                colors_limit: Int32? = nil,
                line_width: Float32? = nil,
                usegit: Bool? = nil
    ){
        self.width = width
        self.height = height
        self.leftMargin = leftMargin
        self.rightMargin = rightMargin
        self.topMargin = topMargin
        self.bottomMargin = bottomMargin
        self.background = background
        self.error_threshold = error_threshold
        self.max_iterations = max_iterations
        self.colors_limit = colors_limit
        self.line_width = line_width
        self.usegit = usegit
    }
    
    public enum CodingKeys: String, CodingKey {
        case width = "width"
        case height = "height"
        case leftMargin = "leftmargin"
        case rightMargin = "rightmargin"
        case topMargin = "topmargin"
        case bottomMargin = "bottommargin"
        case background = "background"
        case error_threshold = "error_threshold"
        case max_iterations = "max_iterations"
        case colors_limit = "colors_limit"
        case line_width = "line_width"
        case usegit = "usegit"
    }

}
