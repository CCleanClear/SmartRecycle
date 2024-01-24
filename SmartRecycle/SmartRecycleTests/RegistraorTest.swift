//
//  RegistraorTest.swift
//  SmartRecycleTests
//
//  Created by Crystal Chan on 21/1/2024.
//

import XCTest
@testable import SmartRecycle
final class RegistraorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func RegistorTest() throws {
        let register = RegistrationView()
        let userNmae = "John Chan"
        
        let uNameRule = register.NameRule(userName: userNmae)
        let expected = "John Chan"
        
        XCTAssertEqual(userNmae, expected, "Test Success")
        
    }
    
    func RegisterNameMax() throws {
        let register = RegistrationView()
        let userName = String(repeating: "a", count: 21)
        
        let uNameRule = register.NameRule(userName: userName)
        let expected = "Over maximum limit"
        
        XCTAssertEqual(userName, expected, "Test Failed")
        
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
