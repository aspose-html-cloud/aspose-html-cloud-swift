/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="JobRequest.swift">
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

public struct JobRequest: Codable {

    public var inputPath: String
    public var storageName: String?
    public var resources: [String]?
    public var outputFile: String?
    public var options: Options?

    public init(inputPath: String, outputFile: String?, options: Options? = nil, storageName: String? = nil, resources: [String]? = nil) {
        self.inputPath = inputPath
        self.outputFile = outputFile
        self.options = options
        self.storageName = storageName
        self.resources = resources

    }
	
    public var additionalProperties: [String:JSONValue] = [:]

    public subscript(key: String) -> JSONValue? {
        get {
            if let value = additionalProperties[key] {
                return value
            }
            return nil
        }

        set {
            additionalProperties[key] = newValue
        }
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encode(inputPath, forKey: "inputPath")
        try container.encodeIfPresent(storageName, forKey: "storageName")
        try container.encodeIfPresent(resources, forKey: "resources")
        try container.encodeIfPresent(outputFile, forKey: "outputFile")
        try container.encodeIfPresent(options, forKey: "options")
        try container.encodeMap(additionalProperties)
    }

    // Decodable protocol methods

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        inputPath = try container.decode(String.self, forKey: "inputPath")
        storageName = try container.decodeIfPresent(String.self, forKey: "storageName")
        resources = try container.decodeIfPresent([String].self, forKey: "resources")
        outputFile = try container.decodeIfPresent(String.self, forKey: "outputFile")
        options = try container.decodeIfPresent(Options.self, forKey: "options")
        var nonAdditionalPropertyKeys = Set<String>()
        nonAdditionalPropertyKeys.insert("inputPath")
        nonAdditionalPropertyKeys.insert("storageName")
        nonAdditionalPropertyKeys.insert("resources")
        nonAdditionalPropertyKeys.insert("outputFile")
        nonAdditionalPropertyKeys.insert("options")
        additionalProperties = try container.decodeMap(JSONValue.self, excludedKeys: nonAdditionalPropertyKeys)
    }



}

