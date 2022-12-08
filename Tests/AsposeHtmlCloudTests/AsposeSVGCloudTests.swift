/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeSVGCloudTests.swift">
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
final class AsposeSVGCloudTests: TestBaseCase {
    
    func testLocalToLocalSVGToDoc() {
        let formats = ["pdf", "xps"]

        let fileName = "testpage1.svg"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to  \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocSVGDoc.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToLocalSVGToDocWithOptions() {
        let formats = ["pdf", "xps"]

        let fileName = "testpage1.svg"
        let src = url(forResource: fileName).absoluteString
        let options_A4 = Options(width: 8.3, height: 11.7, leftMargin: 0.2, rightMargin: 0.2, topMargin: 0.2, bottomMargin: 0.2)

        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocDocSVGWithOpt.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options_A4) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    
    func testLocalToLocalSVGToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "testpage1.svg"
        let src = url(forResource: fileName).absoluteString
        let options = Options(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocSVGImg.\(format)").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to image. Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToStorageSVGToDoc() {
        let formats = ["pdf", "xps"]

        let fileName = "testpage1.svg"
        let src = url(forResource: fileName).absoluteString
        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = "TestFolder/LocToStorSVGDoc.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
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

    func testLocalToStorageSVGToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]

        let fileName = "testpage1.svg"
        let src = url(forResource: fileName).absoluteString
        let options = Options(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = "TestFolder/LocToStorSVGImg.\(format)"
            HtmlAPI.convertLocalToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
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

    func testStorageToLocalSVGToDoc() {

        let formats = ["pdf", "xps"]
        let src = "testpage1.svg"

        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocSVGDoc.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToLocalSVGToImage() {

        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "testpage1.svg"
        let options = Options(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = resultDir.appendingPathComponent("StorToLocSVGImg.\(format)").absoluteString
            HtmlAPI.convertStorageToLocal(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testStorageToStorageSVGToDoc() {
        let formats = ["pdf", "xps"]
        let src = "testpage1.svg"
        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = "TestFolder/StorToStorSVGDoc.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
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

    func testStorageToStorageSVGToImage() {
        let formats = ["jpeg", "jpg", "bmp", "png", "tiff", "tif", "gif"]
        let src = "testpage1.svg"
        let options = Options(width: 800, height: 600, leftMargin: 10,
                rightMargin: 10, topMargin: 10, bottomMargin: 10)

        for format in formats {
            let expectation = self.expectation(description: "testConvert SVG to \(format)")
            let dst = "TestFolder/StorToStorSVGImg.\(format)"
            HtmlAPI.convertStorageToStorage(src: src, dst: dst, storage: nil, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert svg to \(format)). Error=\(error!.localizedDescription)")
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

    func testConvertSVG() {
        
        let expectation = self.expectation(description: "testConvertSVG")
        let fileName = "testpage1.svg"
        let src = url(forResource: fileName).absoluteString
        let dst = resultDir.appendingPathComponent("testSVGConvert.jpg").absoluteString
        
        HtmlAPI.convert(src: src, dst: dst, srcInLocal: true, dstInLocal: true, isUrl: false, options: nil, storage: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error convert svg to image. Error=\(error!.localizedDescription)")
                return
            }
            let resultPath = data!.file!
            XCTAssertTrue(self.fileExist(name: resultPath))

            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }


    static var allTests = [
        ("testLocalToLocalSVGToDoc", testLocalToLocalSVGToDoc),
        ("testLocalToLocalSVGToImage", testLocalToLocalSVGToImage),
        ("testLocalToStorageSVGToDoc", testLocalToStorageSVGToDoc),
        ("testLocalToStorageSVGToImage", testLocalToStorageSVGToImage),
        ("testStorageToLocalSVGToDoc", testStorageToLocalSVGToDoc),
        ("testStorageToLocalSVGToImage", testStorageToLocalSVGToImage),
        ("testStorageToStorageSVGToDoc", testStorageToStorageSVGToDoc),
        ("testStorageToStorageSVGToImage", testStorageToStorageSVGToImage),
        ("testConvertSVG", testConvertSVG)
    ]
}
