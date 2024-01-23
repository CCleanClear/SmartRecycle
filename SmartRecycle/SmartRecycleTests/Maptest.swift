//
//  Maptest.swift
//  SmartRecycleTests
//
//  Created by Crystal Chan on 22/1/2024.
//

import XCTest
import CoreLocation
@testable import SmartRecycle

final class Maptest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func MapUpdateTest() throws {
        let viewModel = MapViewModel()
        
        let location = CLLocation(latitude: viewModel.region.center.latitude, longitude: viewModel.region.center.longitude)
        
        viewModel.locationManager(CLLocationManager(), didUpdateLocations: [location])
        
        let expectedLatitude = round(location.coordinate.latitude * 1_000_000) / 1_000_000
        let expectedLongitude = round(location.coordinate.longitude * 1_000_000) / 1_000_000
        
        XCTAssertEqualWithAccuracy(viewModel.region.center.latitude, expectedLatitude, accuracy: 0.00001)
        XCTAssertEqualWithAccuracy(viewModel.region.center.longitude, expectedLongitude, accuracy: 0.00001)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
