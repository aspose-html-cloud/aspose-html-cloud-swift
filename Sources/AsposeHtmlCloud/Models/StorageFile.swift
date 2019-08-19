/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="StorageFile.swift">
 *  Copyright (c) 2019 Aspose.HTML for Cloud
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
public struct StorageFile: Codable {


    /** File or folder name. */
    public var name: String?

    /** True if it is a folder. */
    public var isFolder: Bool

    /** File or folder last modified DateTime. */
    public var modifiedDate: String?

    /** File or folder size. */
    public var size: Int64

    /** File or folder path. */
    public var path: String?
    public init(name: String?, isFolder: Bool, modifiedDate: String?, size: Int64, path: String?) {
        self.name = name
        self.isFolder = isFolder
        self.modifiedDate = modifiedDate
        self.size = size
        self.path = path
    }
    public enum CodingKeys: String, CodingKey { 
        case name = "name"
        case isFolder = "isFolder"
        case modifiedDate = "modifiedDate"
        case size = "size"
        case path = "path"
    }

}
