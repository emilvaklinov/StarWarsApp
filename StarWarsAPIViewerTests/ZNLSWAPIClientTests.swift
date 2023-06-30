//
//  ZNLSWAPIClientTests.swift
//  StarWarsAPIViewerTests
//
//  Created by Scott Runciman on 21/07/2021.
//

import XCTest
@testable import StarWarsAPIViewer

class ZNLSWAPIClientTests: XCTestCase {

    func testBeginRequestForEndpoint() {
        let baseURL = URL(string: "https://swapi.dev/api/")!
        let session = MockURLSession(configuration: URLSessionConfiguration.ephemeral)
        let apiClient = ZNLSWAPIClient(baseURL: baseURL, using: session)
        
        let endpoint = "planets"
        let expectation = XCTestExpectation(description: "Network request completion")
        
        apiClient.beginRequest(forEndpoint: endpoint) { (data, error) in
            // Assert the completion behavior
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        // Verification that the correct URL was used
        XCTAssertEqual(session.lastRequest?.url?.absoluteString, "https://swapi.dev/api/planets")
        
        // Simulate a successful response
        let response = HTTPURLResponse(url: baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        let data = Data()
        session.lastCompletionHandler?(data, response, nil)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Create a mock URLSession for testing
    class MockURLSession: URLSession {
        var lastRequest: URLRequest?
        var lastCompletionHandler: ((Data?, URLResponse?, Error?) -> Void)?
        
        init(configuration: URLSessionConfiguration) {
            super.init()
        }
      
        class func sessionWithConfiguration(configuration: URLSessionConfiguration) -> URLSession {
            return URLSession(configuration: configuration)
        }

        override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            lastRequest = request
            lastCompletionHandler = completionHandler
            return URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        }
    }
}
