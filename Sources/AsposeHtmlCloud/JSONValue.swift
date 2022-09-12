/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="JSONValue.swift">
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


public enum JSONValue: Codable, Equatable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    case null
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let string): try container.encode(string)
        case .int(let int): try container.encode(int)
        case .double(let double): try container.encode(double)
        case .bool(let bool): try container.encode(bool)
        case .object(let object): try container.encode(object)
        case .array(let array): try container.encode(array)
        case .null: try container.encode(Optional<String>.none)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = try ((try? container.decode(String.self)).map(JSONValue.string))
            .or((try? container.decode(Int.self)).map(JSONValue.int))
            .or((try? container.decode(Double.self)).map(JSONValue.double))
            .or((try? container.decode(Bool.self)).map(JSONValue.bool))
            .or((try? container.decode([String: JSONValue].self)).map(JSONValue.object))
            .or((try? container.decode([JSONValue].self)).map(JSONValue.array))
            .or((container.decodeNil() ? .some(JSONValue.null) : .none))
            .resolve(
                with: DecodingError.typeMismatch(
                    JSONValue.self,
                    DecodingError.Context(
                        codingPath: container.codingPath,
                        debugDescription: "Not a JSON value"
                )
            )
        )
    }
    
}

extension JSONValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}
extension JSONValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .int(value)
    }
}
extension JSONValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}
extension JSONValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}
extension JSONValue: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, JSONValue)...) {
        self = .object([String: JSONValue](uniqueKeysWithValues: elements))
    }
}
extension JSONValue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: JSONValue...) {
        self = .array(elements)
    }
}

fileprivate extension Optional {
    func or(_ other: Optional) -> Optional {
        switch self {
        case .none: return other
        case .some: return self
        }
    }
    func resolve(with error: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .none: throw error()
        case .some(let wrapped): return wrapped
        }
    }
}
