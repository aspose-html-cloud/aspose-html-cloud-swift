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


    /** Width in pixels. */
    public var width: UInt32?

    /** Height in pixels. */
    public var height: UInt32?
    
    /** Left margin in pixels. */
    public var leftMargin: UInt32?
    
    /** Right margin in pixels. */
    public var rightMargin: UInt32?

    /** Top margin in pixels. */
    public var topMargin: UInt32?

    /** Bottom margin in pixels. */
    public var bottomMargin: UInt32?

    public init(width: UInt32?, height: UInt32?, leftMargin: UInt32?,
                rightMargin: UInt32?, topMargin: UInt32?, bottomMargin: UInt32?) {
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
