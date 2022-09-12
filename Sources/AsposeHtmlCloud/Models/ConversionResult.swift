/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="ConversionResult.swift">
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

/** Object exists */
public struct ConversionResult: Codable {

    /** HTTP code for result. */
    public var code: UInt32

    /** Id of a conversion task */
    public var id: String
 
    /** Status of a conversion task ("pending", "running", "completed", "faulted", "canceled") */
    public var status: String

    /** Description of an error */
    public var description: String?

    /** Reserved */
    public var links: [String:String]?
    
    /** Full path to the result file. If more than one, it's a zip file with result files */
    public var file: String?

    public init() {
        self.code = 0
        self.id = ""
        self.status = "faulted"
        self.description = nil
        self.links = nil
        self.file = ""
    }
    
    public init(code: UInt32, id: String, status: String, description: String?, links: [String:String]?, file: String) {
        self.code = code
        self.id = id
        self.status = status
        self.description = description
        self.links = links
        self.file = file
    }
    
    public enum CodingKeys: String, CodingKey {
        case code = "code"
        case id = "id"
        case status = "status"
        case description = "description"
        case links = "links"
        case file = "file"
    }
    
}
