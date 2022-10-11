/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="ConversionOptions.swift">
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
public struct ConversionOptions: Codable {


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

    public init(width: Float32?, height: Float32?, leftMargin: Float32?,
                rightMargin: Float32?, topMargin: Float32?, bottomMargin: Float32?) {
        self.width = width
        self.height = height
        self.leftMargin = leftMargin
        self.rightMargin = rightMargin
        self.topMargin = topMargin
        self.bottomMargin = bottomMargin
    }
    
    public enum CodingKeys: String, CodingKey {
        case width = "width"
        case height = "height"
        case leftMargin = "leftmargin"
        case rightMargin = "rightmargin"
        case topMargin = "topmargin"
        case bottomMargin = "bottommargin"

    }

}
