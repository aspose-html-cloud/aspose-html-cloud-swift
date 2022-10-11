/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeHtmlCloudTest.swift">
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
final class AsposeHtmlCloudTests: TestBaseCase {
    
    func testLocalToLocalHtmlToDoc() {
        let formats = ["pdf", "xps", "docx", "md", "mhtml", "mht"]

        let fileName = "test1.html"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocDoc.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToLocalHtmlToDocWithOptions() {
        let formats = ["pdf", "xps", "docx"]

        let fileName = "test1.html"
        let src = url(forResource: fileName).absoluteString
        let options_A4 = ConversionOptions(width: 8.3, height: 11.7, leftMargin: 0.2, rightMargin: 0.2, topMargin: 0.2, bottomMargin: 0.2)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocDocWithOpt.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options_A4) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    
    func testLocalToLocalHtmlToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "test1.html"
        let src = url(forResource: fileName).absoluteString
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocImg.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to image. Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToStorageHtmlToDoc() {
        let formats = ["pdf", "xps", "docx", "md", "mhtml", "mht"]

        let fileName = "test1.html"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/LocToStorDoc.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
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

    func testLocalToStorageHtmlToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "test1.html"
        let src = url(forResource: fileName).absoluteString
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/LocToStorImg.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
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

    func testStorageToLocalHtmlToDoc() {

        let formats = ["pdf", "xps", "docx", "md", "mhtml", "mht"]
        let src = "test1.html"

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocDoc.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToLocalHtmlToImage() {

        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "test1.html"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocImg.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToStorageHtmlToDoc() {
        let formats = ["pdf", "xps", "docx", "md", "mhtml", "mht"]
        let src = "test1.html"
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/StorToStorDoc.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
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

    func testStorageToStorageHtmlToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "test1.html"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/StorToStorImg.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
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

    func testUrlToLocalDoc() {
        let formats = ["pdf", "xps", "docx", "md", "mhtml", "mht"]

        let src = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("UrlToLocDoc.\(format)").absoluteString
            HtmlAPI.convertUrlToLocal(src: src, dst: dst, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testUrlToLocalImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = resultDir.appendingPathComponent("UrlToLocImg.\(format)").absoluteString
            HtmlAPI.convertUrlToLocal(src: src, dst: dst, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to image. Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }


    func testUrlToStorageDoc() {
        let formats = ["pdf", "xps", "docx", "md", "mhtml", "mht"]
        let src = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/UrlToStorDoc.\(format)"
            HtmlAPI.convertUrlToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert html to \(format)). Error=\(error!.localizedDescription)")
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

    func testUrlToStorageImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert to \(format)")
            let dst = "TestFolder/UrlToStorImg.\(format)"
            HtmlAPI.convertUrlToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error get convert url to \(format)). Error=\(error!.localizedDescription)")
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

    func testConvert() {
        
        let expectation = self.expectation(description: "testConvert")
        let fileName = "test1.html"
        let src = url(forResource: fileName).absoluteString
        let dst = resultDir.appendingPathComponent("test.jpg").absoluteString
        
        HtmlAPI.convert(src: src, dst: dst, srcInLocal: true, dstInLocal: true, isUrl: false, options: nil, storage: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error get convert html to image. Error=\(error!.localizedDescription)")
                return
            }
            let resultPath = data!.file!
            XCTAssertTrue(self.fileExist(name: resultPath))

            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }


    static var allTests = [
        ("testLocalToLocalHtmlToDoc", testLocalToLocalHtmlToDoc),
        ("testLocalToLocalHtmlToImage", testLocalToLocalHtmlToImage),
        ("testLocalToStorageHtmlToDoc", testLocalToStorageHtmlToDoc),
        ("testLocalToStorageHtmlToImage", testLocalToStorageHtmlToImage),
        ("testStorageToLocalHtmlToDoc", testStorageToLocalHtmlToDoc),
        ("testStorageToLocalHtmlToImage", testStorageToLocalHtmlToImage),
        ("testStorageToStorageHtmlToDoc", testStorageToStorageHtmlToDoc),
        ("testStorageToStorageHtmlToImage", testStorageToStorageHtmlToImage),
        ("testUrlToLocalDoc", testUrlToLocalDoc),
        ("testUrlToLocalImage", testUrlToLocalImage),
        ("testUrlToStorageDoc", testUrlToStorageDoc),
        ("testUrlToStorageImage", testUrlToStorageImage),
        ("testConvert", testConvert)
    ]
}
