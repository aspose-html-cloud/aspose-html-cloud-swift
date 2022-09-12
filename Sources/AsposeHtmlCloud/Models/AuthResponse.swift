/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AuthResponse.swift">
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

open class AuthResponse: Codable {
    
    public var accessToken: String
    public var tokenType: String
    public var expiresIn: Int64
//    public var refreshToken: String
//    public var clientId: String
//    public var clientRefreshTokenLifeTimeInMinutes: String
//    public var issued: String
//    public var expires: String
//
    
    public init(accessToken: String, tokenType: String, expiresIn: Int64/*, refreshToken: String, clientId: String,
                clientRefreshTokenLifeTimeInMinutes: String, issued: String, expires: String */) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        //self.refreshToken = refreshToken
        //self.clientId = clientId
        //self.clientRefreshTokenLifeTimeInMinutes = clientRefreshTokenLifeTimeInMinutes
        //self.issued = issued
        //self.expires = expires
    }
    
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: String.self)
        
        try container.encode(accessToken, forKey: "access_token")
        try container.encode(tokenType, forKey: "token_type")
        try container.encode(expiresIn, forKey: "expires_in")
        //try container.encode(refreshToken, forKey: "refresh_token")
        //try container.encode(clientId, forKey: "client_id")
        //try container.encode(clientRefreshTokenLifeTimeInMinutes, forKey: "clientRefreshTokenLifeTimeInMinutes")
        //try container.encode(issued, forKey: ".issued")
        //try container.encode(expires, forKey: ".expires")
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        accessToken = try container.decode(String.self, forKey: "access_token")
        tokenType = try container.decode(String.self, forKey: "token_type")
        expiresIn = try container.decode(Int64.self, forKey: "expires_in")
        //refreshToken = try container.decode(String.self, forKey: "refresh_token")
        //clientId = try container.decode(String.self, forKey: "client_id")
        //clientRefreshTokenLifeTimeInMinutes = try container.decode(String.self, forKey: "clientRefreshTokenLifeTimeInMinutes")
        //issued = try container.decode(String.self, forKey: ".issued")
        //expires = try container.decode(String.self, forKey: ".expires")
    }
}

