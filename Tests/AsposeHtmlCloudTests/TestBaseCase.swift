/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="TestBaseCase.swift">
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
class TestBaseCase : XCTestCase {
  
    let testTimeout = 800.0

    static let fm = FileManager.default
    let resourceDir = fm.homeDirectoryForCurrentUser.appendingPathComponent("Documents/Aspose.HTML.Cloud.SDK.Swift/Tests/AsposeHtmlCloudTests/Resources")

    var resultDir = fm.homeDirectoryForCurrentUser.appendingPathComponent("Documents/Aspose.HTML.Cloud.SDK.Swift/Tests/AsposeHtmlCloudTests/TestResult")
    
    //Call once
    override class func setUp(){
        super.setUp()
        ClientAPI.setConfig(
//            basePath: "https://localhost:5001/v3.0",
            basePath: "https://api-qa.aspose.cloud/v3.0",
            authPath: "https://api-qa.aspose.cloud/connect/token",
            apiKey: "html.cloud",
            appSID: "html.cloud",
            debugging: true)

        //Create test directory (blocking!!!)
        let sem = DispatchSemaphore(value: 0)

        StorageAPI.createFolder(path: "HtmlTesting", storageName: nil) {(data, error) in
            guard error == nil else {
                XCTFail("Error create folder. Error=\(error!.localizedDescription)")
                return
            }
            sem.signal()
        }
        let _ = sem.wait(timeout: .now() + 10)
    }
    
    //Call before each test
    override func setUp(){
        super.setUp()
    }

	//Call once
	class func TearDown(){

        let sem = DispatchSemaphore(value: 0)

        StorageAPI.deleteFolder(path: "HtmlTesting", storageName: nil, recursive: true) {(data, error) in
            guard error == nil else {
                XCTFail("Error delete folder. Error=\(error!.localizedDescription)")
                return
            }
            sem.signal()
        }
        let _ = sem.wait(timeout: .now() + 10)
	}

	/* Helper functions */

    func url(forResource fileName: String) -> URL {
        return resourceDir.appendingPathComponent(fileName)
    }
    
    func saveFile(what data: Data?, fileName name: String) {
        
        let pathFile = resultDir.appendingPathComponent(name)

        do{
            _ = try data!.write(to: pathFile)
        }catch{
            print("Error save file.")
        }
    }
	
	func downloadFileHelper(name: String, folder: String = "HtmlTesting") {

        let sem = DispatchSemaphore(value: 0)

		let path = folder + "/" + name 
		
		StorageAPI.downloadFile(path: path, storageName: nil, versionId: nil) {(data, error) in
			guard error == nil else {
				XCTFail("Error download file. Error=\(error!.localizedDescription)")
				return
			}

			self.saveFile(what: data, fileName: name)
            sem.signal()
		}
        let _ = sem.wait(timeout: .now() + 300)
	}
}
