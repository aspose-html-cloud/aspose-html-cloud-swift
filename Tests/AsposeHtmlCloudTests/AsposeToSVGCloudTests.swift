/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Aspose" file="AsposeToSVGCloudTests.swift">
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
final class AsposeToSVGCloudTests: TestBaseCase {
    
    func testLocalToLocalToSVG() {
        let formats = ["jpg", "bmp", "tiff", "png", "gif"]

        let fileName = "car."
        for format in formats {
            let src = url(forResource: fileName).absoluteString + format
            let expectation = self.expectation(description: "testConvert to SVG from  \(format)")
            let dst = resultDir.appendingPathComponent("LocToLocSVGTo\(format).svg").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: nil) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert to svg from \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }

    func testLocalToLocalToSVGWithOptions() {
        let formats = ["jpg", "bmp", "tiff", "png", "gif"]

        let fileName = "car."
        let options = ConversionOptions(error_threshold: 5, max_iterations: 30, colors_limit: 3, line_width: 2.0 )

        for format in formats {
            let src = url(forResource: fileName).absoluteString + format
            let expectation = self.expectation(description: "testConvert to SVG from \(format)")
            let dst = resultDir.appendingPathComponent("ToSVGFrom\(format)WithOpt.svg").absoluteString
            HtmlAPI.convertLocalToLocal(src: src, dst: dst, options: options) { (data, error) in

                guard error == nil else {
                    XCTFail("Error convert to svg from \(format)). Error=\(error!.localizedDescription)")
                    return
                }
                let resultPath = data!.file!
                XCTAssertTrue(self.fileExist(name: resultPath))
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: testTimeout, handler: nil)
        }
    }


    static var allTests = [
        ("testLocalToLocalToSVG", testLocalToLocalToSVG),
        ("testLocalToLocalToSVGWithOptions", testLocalToLocalToSVGWithOptions)
    ]
}
