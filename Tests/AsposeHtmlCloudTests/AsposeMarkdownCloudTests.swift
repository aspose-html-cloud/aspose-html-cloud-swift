/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeMarkdownCloudTest.swift">
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


import Alamofire
import Foundation
import XCTest
@testable import AsposeHtmlCloud

@available(OSX 10.12, *)
final class AsposeMarkdownCloudTests: TestBaseCase {
    
    func testLocalToLocalMarkdownToDoc() {
        let formats = ["pdf", "xps", "docx", "html", "mhtml", "mht"]

        let fileName = "README.md"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocMDDoc.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToLocalMarkdownToDocWithOptions() {
        let formats = ["pdf", "xps", "docx"]

        let fileName = "README.md"
        let src = url(forResource: fileName).absoluteString
        let options_A4 = ConversionOptions(width: 8.3, height: 11.7, leftMargin: 0.2, rightMargin: 0.2, topMargin: 0.2, bottomMargin: 0.2)

        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocMDDocWithOpt.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options_A4) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    
    func testLocalToLocalMarkdownToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "README.md"
        let src = url(forResource: fileName).absoluteString
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocMDImg.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to image. Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToStorageMarkdownToDoc() {
        let formats = ["pdf", "xps", "docx", "html", "mhtml", "mht"]

        let fileName = "README.md"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/LocToStorMDDoc.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }

                let resultPath = data!.file!

                StorageAPI.objectExists(path: resultPath, storageName: nil, versionId: nil) {(data, error) in
                    guard error == nil else {
                        XCTFail("Error objectExists exist. Error=\(error!.localizedDescription)")
                        return
                    }

                    XCTAssertTrue(data!.exists)
                    XCTAssertFalse(data!.isFolder)
                    expectation.fulfill()
                }
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToStorageMarkdownToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "README.md"
        let src = url(forResource: fileName).absoluteString
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = "TestFolder/LocToStorMDImg.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }

                let resultPath = data!.file!

                StorageAPI.objectExists(path: resultPath, storageName: nil, versionId: nil) {(data, error) in
                    guard error == nil else {
                        XCTFail("Error objectExists exist. Error=\(error!.localizedDescription)")
                        return
                    }

                    XCTAssertTrue(data!.exists)
                    XCTAssertFalse(data!.isFolder)
                    expectation.fulfill()
                }
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToLocalMarkdownToDoc() {

        let formats = ["pdf", "xps", "docx", "html", "mhtml", "mht"]
        let src = "README.md"

        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocMDDoc.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToLocalMarkdownToImage() {

        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "README.md"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocMDImg.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToStorageMarkdownToDoc() {
        let formats = ["pdf", "xps", "docx", "html", "mhtml", "mht"]
        let src = "README.md"
        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = "TestFolder/StorToStorMDDoc.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }

                let resultPath = data!.file!

                StorageAPI.objectExists(path: resultPath, storageName: nil, versionId: nil) {(data, error) in
                    guard error == nil else {
                        XCTFail("Error objectExists exist. Error=\(error!.localizedDescription)")
                        return
                    }

                    XCTAssertTrue(data!.exists)
                    XCTAssertFalse(data!.isFolder)
                    expectation.fulfill()
                }
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToStorageMarkdownToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "README.md"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert markdown to \(format)")
            let dst = "TestFolder/StorToStorMDImg.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert markdown to \(format)). Error=\(error!.localizedDescription)")
                    return
                }

                let resultPath = data!.file!

                StorageAPI.objectExists(path: resultPath, storageName: nil, versionId: nil) {(data, error) in
                    guard error == nil else {
                        XCTFail("Error objectExists exist. Error=\(error!.localizedDescription)")
                        return
                    }

                    XCTAssertTrue(data!.exists)
                    XCTAssertFalse(data!.isFolder)
                    expectation.fulfill()
                }
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testConvertMD() {
        
        let expectation = self.expectation(description: "testConvert")
        let fileName = "README.md"
        let src = url(forResource: fileName).absoluteString
        let dst = resultDir.appendingPathComponent("test.jpg").absoluteString
        
        HtmlAPI.convert(src: src, dst: dst, srcInLocal: true, dstInLocal: true, isUrl: false, options: nil, storage: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error convert markdown to image. Error=\(error!.localizedDescription)")
                return
            }
            let resultPath = data!.file!
            XCTAssertTrue(self.fileExist(name: resultPath))

            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }


    static var allTests = [
        ("testLocalToLocalMarkdownToDoc", testLocalToLocalMarkdownToDoc),
        ("testLocalToLocalMarkdownToImage", testLocalToLocalMarkdownToImage),
        ("testLocalToStorageMarkdownToDoc", testLocalToStorageMarkdownToDoc),
        ("testLocalToStorageMarkdownToImage", testLocalToStorageMarkdownToImage),
        ("testStorageToLocalMarkdownToDoc", testStorageToLocalMarkdownToDoc),
        ("testStorageToLocalMarkdownToImage", testStorageToLocalMarkdownToImage),
        ("testStorageToStorageMarkdownToDoc", testStorageToStorageMarkdownToDoc),
        ("testStorageToStorageMarkdownToImage", testStorageToStorageMarkdownToImage),
        ("testConvertMD", testConvertMD)
    ]
}
