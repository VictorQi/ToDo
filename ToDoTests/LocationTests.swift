//
//  LocationTests.swift
//  ToDo
//
//  Created by Victor on 2017/4/12.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func test_Init_WhenGivenName_SetsCoordinate() {
        let location = Location(name: "Foo")
        
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_WhenGivenCoordinate_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        XCTAssertEqual(first, second)
    }
    
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        performNotEqualTest(with: "Foo",
                            secondName: "Foo",
                            firstLongLat: (1.0, 0.0),
                            secondLongLat: (0.0, 0.0))
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        performNotEqualTest(with: "Foo",
                            secondName: "Foo",
                            firstLongLat: (0.0, 1.0),
                            secondLongLat: nil)
    }
    
    func test_Locations_WhenNameDiffers_AreNotEqual() {
        performNotEqualTest(with: "Foo", secondName: "Bar", firstLongLat: nil, secondLongLat: nil)
    }
    
    func performNotEqualTest(with firstName: String,
                             secondName: String,
                             firstLongLat: (Double, Double)?,
                             secondLongLat: (Double, Double)?,
                             line: UInt = #line) {
        var firstCoord: CLLocationCoordinate2D? = nil
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        var secondCoord: CLLocationCoordinate2D? = nil
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation, line: line)
    }
}
