/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeHtmlCloudTest.swift">
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


import Alamofire
import Foundation
import XCTest
@testable import AsposeHtmlCloud

@available(OSX 10.12, *)
final class AsposeHtmlCloudTests: TestBaseCase {
    
    /*   Conversion API test   */

    func testGetHtmlToImage() {
        
        let expectation = self.expectation(description: "testGetHtmlToImage")

        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)
            
            let name = "testSwift.html"
            let outFormat = "png"
        
            HtmlAPI.getConvertDocumentToImage(name: name, outFormat: outFormat, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, resolution: 300, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert html to image. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getHtmlToPng.zip")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetEpubToImage() {
        
        let expectation = self.expectation(description: "testGetEpubToImage")

        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.epub",storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }
            
            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.epub"
            let outFormat = "bmp"
        
            HtmlAPI.getConvertDocumentToImage(name: name, outFormat: outFormat, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, resolution: 300, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert epub to image. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getEpubToBmp.zip")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetSvgToImage() {
        
        let expectation = self.expectation(description: "testGetSvgToImage")

        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.svg", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }
            
            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.svg"
            let outFormat = "png"
        
            HtmlAPI.getConvertDocumentToImage(name: name, outFormat: outFormat, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, resolution: 300, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert svg to image. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getSvgToPng.png")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetHtmlToImageByUrl() {
        
        let expectation = self.expectation(description: "testGetConvertDocumentToImageByUrl")
        let url = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        
        HtmlAPI.getConvertDocumentToImageByUrl(sourceUrl: url, outFormat: "bmp", width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, resolution: 300) {(data, error) in
            guard error == nil else {
                XCTFail("Error get convert html to image by url. Error=\(error!.localizedDescription)")
                return
            }
            self.saveFile(what: data, fileName: "HtmlToBmpByUrl.zip")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testGetHtmlToPdf() {
        
        let expectation = self.expectation(description: "testGetHtmlToPdf")
        
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }
            
            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.html"
            
            HtmlAPI.getConvertDocumentToPdf(name: name, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert html to pdf. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getHtmlToPdf.pdf")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testGetEpubToPdf() {
        
        let expectation = self.expectation(description: "testGetEpubToPdf")
        
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.epub", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.epub"
            
            HtmlAPI.getConvertDocumentToPdf(name: name, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert epub to pdf. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getEpubToPdf.pdf")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetSvgToPdf() {
        
        let expectation = self.expectation(description: "testGetSvgToPdf")
        
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.svg", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.svg"
            
            HtmlAPI.getConvertDocumentToPdf(name: name, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert svg to pdf. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getSvgToPdf.pdf")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetHtmlToPdfByUrl() {
        
        let expectation = self.expectation(description: "testGetConvertDocumentToPdfByUrl")
        
        let url = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        
        HtmlAPI.getConvertDocumentToPdfByUrl(sourceUrl: url, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20) {(data, error) in
            guard error == nil else {
                XCTFail("Error get convert document to pdf by url. Error=\(error!.localizedDescription)")
                return
            }
            self.saveFile(what: data, fileName: "getHtmlToPdfByUrl.pdf")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetHtmlToXps() {
        
        let expectation = self.expectation(description: "testGetHtmlToXps")
        
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.html"
            
            HtmlAPI.getConvertDocumentToXps(name: name, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert html to xps. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getHtmlToXps.xps")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetEpubToXps() {
        
        let expectation = self.expectation(description: "testGetEpubToXps")
        
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.epub", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }
  
            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.epub"
            
            HtmlAPI.getConvertDocumentToXps(name: name, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert epub to xps. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getEpubToXps.xps")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testGetSvgToXps() {
        
        let expectation = self.expectation(description: "testGetEpubToXps")
        
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testSwift.svg", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }
 
            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "testSwift.svg"
            
            HtmlAPI.getConvertDocumentToXps(name: name, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert svg to xps. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getSvgToXps.xps")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetHtmlToXpsByUrl() {
        
        let expectation = self.expectation(description: "testGetHtmlToXpsByUrl")
        
        let url = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        
        HtmlAPI.getConvertDocumentToXpsByUrl(sourceUrl: url, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 20, bottomMargin: 20) {(data, error) in
            guard error == nil else {
                XCTFail("Error get convert document to xps by url. Error=\(error!.localizedDescription)")
                return
            }
            self.saveFile(what: data, fileName: "getHtmlToXpsByUrl.xps")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testPostHtmlInRequestToImage(){

        let expectation = self.expectation(description: "testPostHtmlInRequestToImage")
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        let resultName = "postHtmlToPngInReqSwift.zip"
    
        HtmlAPI.postConvertDocumentInRequestToImage(outPath: "HtmlTesting/" + resultName, outFormat: "png", file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, resolution: 300) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert html in request to image. Error=\(error!.localizedDescription)")
                return
            }
			
			// Download result from the storage
            self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPostEpubInRequestToImage(){

        let expectation = self.expectation(description: "testPostEpubInRequestToImage")
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        let resultName = "postEpubToBmpInReqSwift.zip"
    
        HtmlAPI.postConvertDocumentInRequestToImage(outPath: "HtmlTesting/" + resultName, outFormat: "bmp", file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, resolution: 300) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert epub in request to bmp. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
            self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPostSvgInRequestToImage(){

        let expectation = self.expectation(description: "testPostSvgInRequestToImage")
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
		let resultName = "postSvgToPngInReqSwift.png"
    
        HtmlAPI.postConvertDocumentInRequestToImage(outPath: "HtmlTesting/" + resultName, outFormat: "png", file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, resolution: 300) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert svg in request to png. Error=\(error!.localizedDescription)")
                return
            }
			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }
	
    func testPostHtmlInRequestToPdf(){

        let expectation = self.expectation(description: "testPostHtmlInRequestToPdf")
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
		let resultName = "postHtmlToPdfInReqSwift.pdf"
        
        HtmlAPI.postConvertDocumentInRequestToPdf(outPath: "HtmlTesting/" + resultName, file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert html in request to pdf. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)       
    }
	
    func testPostEpubInRequestToPdf(){

        let expectation = self.expectation(description: "testPostEpubInRequestToPdf")
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
		let resultName = "postEpubToPdfInReqSwift.pdf"
        
        HtmlAPI.postConvertDocumentInRequestToPdf(outPath: "HtmlTesting/" + resultName, file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert epub in request to pdf. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }
	
    func testPostSvgInRequestToPdf(){

        let expectation = self.expectation(description: "testPostSvgInRequestToPdf")
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
		let resultName = "postSvgToPdfInReqSwift.pdf"
        
        HtmlAPI.postConvertDocumentInRequestToPdf(outPath: "HtmlTesting/" + resultName, file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert svg in request to pdf. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPostHtmlInRequestToXps(){

        let expectation = self.expectation(description: "testPostHtmlInRequestToXps")
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
		let resultName = "postHtmlToXpsInReqSwift.xps"
        
        HtmlAPI.postConvertDocumentInRequestToXps(outPath: "HtmlTesting/" + resultName, file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert html in request to xps. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPostEpubInRequestToXps(){

        let expectation = self.expectation(description: "testPostEpubInRequestToXps")
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
		let resultName = "postEpubToXpsInReqSwift.xps"
        
        HtmlAPI.postConvertDocumentInRequestToXps(outPath: "HtmlTesting/" + resultName, file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert epub in request to xps. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPostSvgInRequestToXps(){

        let expectation = self.expectation(description: "testPostSvgInRequestToXps")
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
		let resultName = "postSvgToXpsInReqSwift.xps"
        
        HtmlAPI.postConvertDocumentInRequestToXps(outPath: "HtmlTesting/" + resultName, file: urlTest, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert svg in request to xps. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testPutHtmlToImage(){

        let expectation = self.expectation(description: "testPutHtmlToImage")
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test1.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "test1.html"
            let outFormat = "gif"
            let resultName = "putHtmlToGifSwift.zip"
        
            HtmlAPI.putConvertDocumentToImage(name: name, outPath: "HtmlTesting/" + resultName, outFormat: outFormat, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, resolution: 300, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert html to gif. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testPutEpubToImage(){

        let expectation = self.expectation(description: "testPutEpubToImage")
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/georgia.epub", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "georgia.epub"
            let outFormat = "gif"
            let resultName = "putEpubToGifSwift.zip"
        
            HtmlAPI.putConvertDocumentToImage(name: name, outPath: "HtmlTesting/" + resultName, outFormat: outFormat, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, resolution: 300, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert epub to image. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutSvgToImage(){

        let expectation = self.expectation(description: "testPutSvgToImage")
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/Map-World.svg", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "Map-World.svg"
            let outFormat = "jpeg"
            let resultName = "putSvgToJpegSwift.jpeg"
        
            HtmlAPI.putConvertDocumentToImage(name: name, outPath: "HtmlTesting/" + resultName, outFormat: outFormat, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, resolution: 300, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert svg to jpeg. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutHtmlToPdf(){

        let expectation = self.expectation(description: "testPutHtmlToPdf")
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test1.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let resultName = "putHtmlToPdfSwift.pdf"

            HtmlAPI.putConvertDocumentToPdf(name: fileName, outPath: "HtmlTesting/" + resultName, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert html to pdf. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testPutEpubToPdf(){

        let expectation = self.expectation(description: "testPutEpubToPdf")
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/georgia.epub", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let resultName = "putEpubToPdfSwift.pdf"

            HtmlAPI.putConvertDocumentToPdf(name: fileName, outPath: "HtmlTesting/" + resultName, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert epub to pdf. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutSvgToPdf(){

        let expectation = self.expectation(description: "testPutSvgToPdf")
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/Map-World.svg", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let resultName = "putSvgToPdfSwift.pdf"

            HtmlAPI.putConvertDocumentToPdf(name: fileName, outPath: "HtmlTesting/" + resultName, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert svg to pdf. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutHtmlToXps(){
    
        let expectation = self.expectation(description: "testPutHtmlToXps")
        let fileName = "test1.html"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test1.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let resultName = "putHtmlToXpsSwift.xps"

            HtmlAPI.putConvertDocumentToXps(name: fileName, outPath: "HtmlTesting/" + resultName, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert html to xps. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
                self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutEpubToXps(){
    
        let expectation = self.expectation(description: "testPutEpubToXps")
        let fileName = "georgia.epub"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/georgia.epub", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let resultName = "putEpubToXpsSwift.xps"

            HtmlAPI.putConvertDocumentToXps(name: fileName, outPath: "HtmlTesting/" + resultName, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert epub to xps. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutSvgToXps(){
    
        let expectation = self.expectation(description: "testPutSvgToXps")
        let fileName = "Map-World.svg"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/Map-World.svg", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let resultName = "putSvgToXpsSwift.xps"

            HtmlAPI.putConvertDocumentToXps(name: fileName, outPath: "HtmlTesting/" + resultName, width: 800, height: 1000, leftMargin: 10, rightMargin: 10, topMargin: 10, bottomMargin: 10, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert svg to xps. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testGetConvertDocumentToMHTMLByUrl() {

        let expectation = self.expectation(description: "testGetConvertDocumentToMHTMLByUrl")

        let url = "https://www.yahoo.com"

        HtmlAPI.getConvertDocumentToMHTMLByUrl(sourceUrl: url) {(data, error) in
            guard error == nil else {
                XCTFail("Error get convert document to mhtml by url. Error=\(error!.localizedDescription)")
                return
            }
            self.saveFile(what: data, fileName: "convertToMhtmlByUrl.mht")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 3600.0, handler: nil)
    }

    func testGetConvertDocumentToMarkdown() {
        
        let expectation = self.expectation(description: "testGetConvertDocumentToMarkdown")
        
        let fileName = "test_md.html"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test_md.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            let name = "test_md.html"
            
            HtmlAPI.getConvertDocumentToMarkdown(name: name, useGit: "true", folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert document to markdown. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getConvToMarkdown.md")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testPostConvertDocumentInRequestToMarkdown(){
        
        let expectation = self.expectation(description: "testPostConvertDocumentInRequestToMarkdown")
        let fileName = "test_md.html"
        let urlTest = url(forResource: fileName)
        let resultName = "postConvToMarkdownInReqSwift.md"        

        HtmlAPI.postConvertDocumentInRequestToMarkdown(outPath: "HtmlTesting/" + resultName, file: urlTest, useGit: "false", storage: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert document in request to markdown. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
			expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutConvertDocumentToMarkdown(){
        
        let expectation = self.expectation(description: "testPutConvertDocumentToMarkdown")
        let fileName = "test_md.html"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test_md.html", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)
			
			let resultName = "putConvertDocToMarkdownSwift.md"        

            HtmlAPI.putConvertDocumentToMarkdown(name: fileName, outPath: "HtmlTesting/" + resultName, useGit: "true", folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert document to markdown. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
				expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    /*    Import API tests    */

    func testGetConvertMarkdownToHtml() {
        
        let expectation = self.expectation(description: "testGetConvertMarkdownToHtml")
        
        let fileName = "testpage1.md"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testpage1.md", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)
            
            HtmlAPI.getConvertMarkdownToHtml(name: fileName, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get convert markdown to html. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getConvMarkdownToHtml.html")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testPostConvertMarkdownInRequestToHtml(){
        
        let expectation = self.expectation(description: "testPostConvertMarkdownInRequestToHtml")
        let fileName = "testpage1.md"
        let urlTest = url(forResource: fileName)
		let resultName = "postConvertMarkdownInRequestToHtmlSwift.html"      
        
        HtmlAPI.postConvertMarkdownInRequestToHtml(outPath: "HtmlTesting/" + resultName, file: urlTest, storage: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error post convert markdown in request to html. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    func testPutConvertMarkdownToHtml(){
        
        let expectation = self.expectation(description: "testPutConvertMarkdownToHtml")
        let fileName = "testpage1.md"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/testpage1.md", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

			let resultName = "putConvertMarkdownToHtmlSwift.html"

            HtmlAPI.putConvertMarkdownToHtml(name: fileName, outPath: "HtmlTesting/" + resultName, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error put convert markdown to html. Error=\(error!.localizedDescription)")
                    return
                }

				// Download result from the storage
				self.downloadFileHelper(name: resultName)
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 1200.0, handler: nil)
    }

    /*    Document API tests    */

    func testGetDocumentByUrl() {
        
        let expectation = self.expectation(description: "testGetDocumentImagesByUrl")
        
        let url = "https://yahoo.com/"
        
        HtmlAPI.getDocumentByUrl(sourceUrl: url)
        {(data, error) in
            guard error == nil else {
                XCTFail("Error get download site. Error=\(error!.localizedDescription)")
                return
            }
            self.saveFile(what: data, fileName: "getDownloadSite.zip")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 3600, handler: nil)
    }

    func testGetDocumentFragmentByXPath() {
        
        let expectation = self.expectation(description: "testGetDocumentFragmentByXPath")

        let fileName = "test2.html.zip"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test2.html.zip", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)
 
            HtmlAPI.getDocumentFragmentByXPath(name: fileName, xPath: ".//p", outFormat: "plain", storage: nil, folder: "HtmlTesting") {(data, error) in
                guard error == nil else {
                    XCTFail("Error get document by xpath. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "testXPath.html")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetDocumentFragmentByXPathByUrl() {

        let expectation = self.expectation(description: "testGetDocumentFragmentByXPath")

        let url = "https://stallman.org/articles/anonymous-payments-thru-phones.html"
        
        HtmlAPI.getDocumentFragmentByXPathByUrl(sourceUrl: url, xPath: ".//p", outFormat: "plain")
            {(data, error) in
                guard error == nil else {
                    XCTFail("Error get document fragment by xpath by url. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getDocXpathUrl.html")
                expectation.fulfill()
            }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetDocumentFragmentByCSS() {
        
        let expectation = self.expectation(description: "testGetDocumentFragmentByCSS")

        let fileName = "test2.html.zip"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test2.html.zip", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)
 
            HtmlAPI.getDocumentFragmentsByCSSSelector(name: fileName, selector: "div p", outFormat: "plain", folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get document by css. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "testCSS.html")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetDocumentFragmentByCSSByUrl() {

        let expectation = self.expectation(description: "testGetDocumentFragmentByCSSByUrl")

        let url = "https://www.w3schools.com/cssref/css_selectors.asp"
        
        HtmlAPI.getDocumentFragmentsByCSSSelectorByUrl(sourceUrl: url, selector: "a[href$='.asp']", outFormat: "plain")
            {(data, error) in
                guard error == nil else {
                    XCTFail("Error get document fragment by css by url. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getDocCSSUrl.html")
                expectation.fulfill()
            }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
   
    func testGetDocumentImages() {
        
        let expectation = self.expectation(description: "testGetDocumentImages")

        let fileName = "test3.html.zip"
        let urlTest = url(forResource: fileName)
        
        // Upload file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting/test3.html.zip", storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            HtmlAPI.getDocumentImages(name: fileName, folder: "HtmlTesting", storage: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error get document images. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getDocImages.zip")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetDocumentImagesByUrl() {
    
        let expectation = self.expectation(description: "testGetDocumentImagesByUrl")

        let url = "https://www.google.com/"
        
        HtmlAPI.getDocumentImagesByUrl(sourceUrl: url)
            {(data, error) in
                guard error == nil else {
                    XCTFail("Error get document images by url. Error=\(error!.localizedDescription)")
                    return
                }
                self.saveFile(what: data, fileName: "getDocImgUrl.zip")
                expectation.fulfill()
            }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testGetMergeHtmlTemplate(){
        
        let expectation = self.expectation(description: "testGetMergeHtmlTemplate")
        let templateName = "HtmlTemplate.html"
        let dataName = "XmlSourceData.xml"
        let urlTemplate = url(forResource: templateName)
        let urlData = url(forResource: dataName)
        
        // Upload template file to storage
        StorageAPI.uploadFile(file: urlTemplate, path: "HtmlTesting/" + templateName, storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            // Upload data file to storage
            StorageAPI.uploadFile(file: urlData, path: "HtmlTesting/" + dataName, storageName: nil){(data, error) in
                guard error == nil else {
                    XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                    return
                }

                XCTAssertEqual(data!.uploaded!.count, 1)
                XCTAssertEqual(data!.errors!.count, 0)
        
                HtmlAPI.getMergeHtmlTemplate(templateName: templateName, dataPath: "HtmlTesting/" + dataName,options:"", folder:"HtmlTesting", storage: nil)
                    {(data, error) in guard error == nil else {
                        XCTFail("Error get template merge. Error=\(error!.localizedDescription)")
                                return
                        }
                    self.saveFile(what: data, fileName: "getTemplateMergeSwift.html")
                    expectation.fulfill()
  
                    }
                }
            }
        self.waitForExpectations(timeout: 300.0, handler: nil)
    }

    func testPostMergeHtmlTemplate(){
        let expectation = self.expectation(description: "testPostMergeHtmlTemplate")
        let templateName = "HtmlTemplate.html"
        let dataName = "XmlSourceData.xml"
        let resultName = "postTemplateMergeSwift.html"
        let urlData = url(forResource: dataName)

        HtmlAPI.postMergeHtmlTemplate(templateName: templateName, outPath: "HtmlTesting/" + resultName, file: urlData, options:"", folder: "HtmlTesting", storage: nil){
            (data, error) in guard error == nil else {
                XCTFail("Error post template merge. Error=\(error!.localizedDescription)")
                return
            }

			// Download result from the storage
			self.downloadFileHelper(name: resultName)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    static var allTests = [
        // Conversion API
        ("testGetHtmlToImage", testGetHtmlToImage),
        ("testGetEpubToImage", testGetEpubToImage),
        ("testGetSvgToImage", testGetSvgToImage),
        ("testGetHtmlToImageByUrl", testGetHtmlToImageByUrl),
        ("testGetHtmlToPdf", testGetHtmlToPdf),
        ("testGetEpubToPdf", testGetEpubToPdf),
        ("testGetSvgToPdf", testGetSvgToPdf),
        ("testGetHtmlToPdfByUrl", testGetHtmlToPdfByUrl),
        ("testGetHtmlToXps", testGetHtmlToXps),
        ("testGetEpubToXps", testGetEpubToXps),
        ("testGetSvgToXps", testGetSvgToXps),
        ("testGetHtmlToXpsByUrl", testGetHtmlToXpsByUrl),
        ("testPostHtmlInRequestToImage", testPostHtmlInRequestToImage),
        ("testPostEpubInRequestToImage", testPostEpubInRequestToImage),
        ("testPostSvgInRequestToImage", testPostSvgInRequestToImage),
        ("testPostHtmlInRequestToPdf", testPostHtmlInRequestToPdf),
        ("testPostEpubInRequestToPdf", testPostEpubInRequestToPdf),
        ("testPostSvgInRequestToPdf", testPostSvgInRequestToPdf),
        ("testPostHtmlInRequestToXps", testPostHtmlInRequestToXps),
        ("testPostEpubInRequestToXps", testPostEpubInRequestToXps),
        ("testPostSvgInRequestToXps", testPostSvgInRequestToXps),
        ("testPutHtmlToImage", testPutHtmlToImage),
        ("testPutEpubToImage", testPutEpubToImage),
        ("testPutSvgToImage", testPutSvgToImage),
        ("testPutHtmlToPdf", testPutHtmlToPdf),
        ("testPutEpubToPdf", testPutEpubToPdf),
        ("testPutSvgToPdf", testPutSvgToPdf),
        ("testPutHtmlToXps", testPutHtmlToXps),
        ("testPutEpubToXps", testPutEpubToXps),
        ("testPutSvgToXps", testPutSvgToXps),
        ("testGetConvertDocumentToMarkdown", testGetConvertDocumentToMarkdown),
        ("testPostConvertDocumentInRequestToMarkdown", testPostConvertDocumentInRequestToMarkdown),
        ("testPutConvertDocumentToMarkdown", testPutConvertDocumentToMarkdown),
        ("testGetConvertMarkdownToHtml", testGetConvertMarkdownToHtml),
        ("testPostConvertMarkdownInRequestToHtml", testPostConvertMarkdownInRequestToHtml),
        ("testPutConvertMarkdownToHtml", testPutConvertMarkdownToHtml),

        // Document API
        ("testGetDocumentByUrl", testGetDocumentByUrl),
        ("testGetDocumentFragmentByXPath", testGetDocumentFragmentByXPath),
        ("testGetDocumentImages", testGetDocumentImages),
        ("testGetDocumentFragmentByXPathByUrl", testGetDocumentFragmentByXPathByUrl),
        ("testGetDocumentImagesByUrl", testGetDocumentImagesByUrl),

        // TemplateMergeApi
        ("testGetMergeHtmlTemplate", testGetMergeHtmlTemplate),
        ("testPostMergeHtmlTemplate", testPostMergeHtmlTemplate),
    ]
}
