/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeMHTMLCloudTest.swift">
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
final class AsposeMHTMLCloudTests: TestBaseCase {
    
    func testLocalToLocalMHTMLToDoc() {
        let formats = ["pdf", "xps", "docx"]

        let fileName = "fileformatinfo.mht"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to  \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocMHTMLDoc.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToLocalMHTMLToDocWithOptions() {
        let formats = ["pdf", "xps", "docx"]

        let fileName = "fileformatinfo.mht"
        let src = url(forResource: fileName).absoluteString
        let options_A4 = ConversionOptions(width: 8.3, height: 11.7, leftMargin: 0.2, rightMargin: 0.2, topMargin: 0.2, bottomMargin: 0.2)

        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocDocMHTMLWithOpt.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options_A4) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    
    func testLocalToLocalMHTMLToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "fileformatinfo.mht"
        let src = url(forResource: fileName).absoluteString
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocMHTMLImg.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to image. Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToStorageMHTMLToDoc() {
        let formats = ["pdf", "xps", "docx"]

        let fileName = "fileformatinfo.mht"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = "TestFolder/LocToStorMHTMLDoc.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
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

    func testLocalToStorageMHTMLToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "fileformatinfo.mht"
        let src = url(forResource: fileName).absoluteString
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = "TestFolder/LocToStorMHTMLImg.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
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

    func testStorageToLocalMHTMLToDoc() {

        let formats = ["pdf", "xps", "docx"]
        let src = "fileformatinfo.mht"

        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocMHTMLDoc.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToLocalMHTMLToImage() {

        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "fileformatinfo.mht"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocMHTMLImg.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToStorageMHTMLToDoc() {
        let formats = ["pdf", "xps", "docx"]
        let src = "fileformatinfo.mht"
        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = "TestFolder/StorToStorMHTMLDoc.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
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

    func testStorageToStorageMHTMLToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "fileformatinfo.mht"
        let options = ConversionOptions(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert MHTML to \(format)")
            let dst = "TestFolder/StorToStorMHTMLImg.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert mhtml to \(format)). Error=\(error!.localizedDescription)")
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

    func testConvertMHTML() {
        
        let expectation = self.expectation(description: "testConvert")
        let fileName = "fileformatinfo.mht"
        let src = url(forResource: fileName).absoluteString
        let dst = resultDir.appendingPathComponent("testMHTMLConvert.jpg").absoluteString
        
        HtmlAPI.convert(src: src, dst: dst, srcInLocal: true, dstInLocal: true, isUrl: false, options: nil, storage: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error convert mhtml to image. Error=\(error!.localizedDescription)")
                return
            }
            let resultPath = data!.file!
            XCTAssertTrue(self.fileExist(name: resultPath))

            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }


    static var allTests = [
        ("testLocalToLocalMHTMLToDoc", testLocalToLocalMHTMLToDoc),
        ("testLocalToLocalMHTMLToImage", testLocalToLocalMHTMLToImage),
        ("testLocalToStorageMHTMLToDoc", testLocalToStorageMHTMLToDoc),
        ("testLocalToStorageMHTMLToImage", testLocalToStorageMHTMLToImage),
        ("testStorageToLocalMHTMLToDoc", testStorageToLocalMHTMLToDoc),
        ("testStorageToLocalMHTMLToImage", testStorageToLocalMHTMLToImage),
        ("testStorageToStorageMHTMLToDoc", testStorageToStorageMHTMLToDoc),
        ("testStorageToStorageMHTMLToImage", testStorageToStorageMHTMLToImage),
        ("testConvertMHTML", testConvertMHTML)
    ]
}
