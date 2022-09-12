/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeStorageCloudTests.swift">
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
final class AsposeStorageCloudTests: TestBaseCase {
    
    /*   Storage API test   */

    func testGetDiskUsage() {
        
        let expectation = self.expectation(description: "TestDiscUsage")
        
        StorageAPI.getDiscUsage(storageName: nil){(data, error) in
            guard error == nil else {
                XCTFail("Error get discUsage. Error=\(error!.localizedDescription)")
                return
            }
	
            XCTAssertTrue(data!.totalSize > 0)
            XCTAssertTrue(data!.usedSize > 0)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testObjectExists_EXIST() {
        
        let expectation = self.expectation(description: "Test is exist folder")
        
        let exist_folder = "HtmlTesting"
        
        StorageAPI.objectExists(path: exist_folder, storageName: nil, versionId: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error objectExists exist. Error=\(error!.localizedDescription)")
                return
            }
            
            XCTAssertTrue(data!.exists)
            XCTAssertTrue(data!.isFolder)
            expectation.fulfill()
        }
            
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testObjectExists_NOTEXIST() {
        
        let expectation = self.expectation(description: "Test is not exist file")
        
        let not_exist_file = "non_exist.gif"
        
        StorageAPI.objectExists(path: not_exist_file, storageName: nil, versionId: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error objectExists not exist. Error=\(error!.localizedDescription)")
                return
            }
            XCTAssertFalse(data!.exists)
            XCTAssertFalse(data!.isFolder)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testStorageExists_NOTEXIST() {
        
        let expectation = self.expectation(description: "Test is not exist storage")
        
        let not_exist_storage = "NOT_EXIST_STORAGE"
        
        StorageAPI.storageExists(storageName: not_exist_storage) {(data, error) in
            guard error == nil else {
                XCTFail("Error get is storage exist. Error=\(error!.localizedDescription)")
                return
            }
            
            XCTAssertFalse(data!.exists)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }


    /*   File API test   */

    func testUploadFile(){
        
        let expectation = self.expectation(description: "Test is uploadFile")
        
        let fileName = "test_ocr.jpg"
        
        let urlTest = url(forResource: fileName)
        
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting", storageName: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testDeleteFile(){
        
        let expectation = self.expectation(description: "Test delete file")
      
        let fileName = "test_ocr.jpg"
        
        let urlTest = url(forResource: fileName)
        
         // Upload test file to storage
        StorageAPI.uploadFile(file: urlTest, path: "HtmlTesting", storageName: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }

            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            StorageAPI.deleteFile(path: "HtmlTesting/\(fileName)") {(data, error) in
                guard error == nil else {
                    XCTFail("Error delete file. Error=\(error!.localizedDescription)")
                    return
                }
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testDownloadFile(){
        
        let expectation = self.expectation(description: "Test download file")
        
        let fileName = "test_ocr.jpg"
        
        let urlTest = url(forResource: fileName)

        StorageAPI.uploadFile(file: urlTest, path: "/", storageName: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error uploadFile. Error=\(error!.localizedDescription)")
                return
            }
            
            XCTAssertEqual(data!.uploaded!.count, 1)
            XCTAssertEqual(data!.errors!.count, 0)

            StorageAPI.downloadFile(path: fileName, storageName: nil, versionId: nil) {(data, error) in
                guard error == nil else {
                    XCTFail("Error download file. Error=\(error!.localizedDescription)")
                    return
                }
         
                self.saveFile(what: data, fileName: "downloaded_file.jpg")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 300.0, handler: nil)
    }

    
    /*   Folder API test   */

    func testCreateFolder(){
        
        let expectation = self.expectation(description: "Test create folder")
        
        StorageAPI.createFolder(path: "HtmlTesting/TestCreateFolder", storageName: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error create folder. Error=\(error!.localizedDescription)")
                return
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }

    func testDeleteFolder(){
        
        let expectation = self.expectation(description: "Test delete folder")
        
        StorageAPI.deleteFolder(path: "HtmlTesting/TestCreateFolder", storageName: nil, recursive: true) {(data, error) in
            guard error == nil else {
                XCTFail("Error delete folder. Error=\(error!.localizedDescription)")
                return
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
    func testGetFilesList(){
        
        let expectation = self.expectation(description: "Test get list files")
        
        StorageAPI.getFilesList(path: "HtmlTesting", storageName: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error get list files. Error=\(error!.localizedDescription)")
                return
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 500.0, handler: nil)
    }

    static var allTests = [
        // Storage API
        ("testDiskUsage", testGetDiskUsage),
        ("testObjectExists_EXIST", testObjectExists_EXIST),
        ("testObjectExists_NOTEXIST", testObjectExists_NOTEXIST),
        ("testStorageExists_NOTEXIST", testStorageExists_NOTEXIST),
        // File API
        ("testUploadFile", testUploadFile),
        ("testDownloadFile", testDownloadFile),
        ("testDeleteFile", testDeleteFile),
        //Folder API
        ("testCreateFolder", testCreateFolder),
        ("testDeleteFolder", testDeleteFolder),
        ("testGetFilesList", testGetFilesList),
    ]
}
