//
//  ToDoItemTests.swift
//  ToDo
//
//  Created by Victor on 2017/4/12.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo", "Should set item title")
    }
    
    func test_Init_WhenGivenDescription_SetsItemDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "Should set item descrition")
    }
    
    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "Should set timestamp")
    }
    
    func test_Init_WhenGivenLocation_SetsLocations() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
//        下面这个断言表述是错误的，因为Location没有遵循Equatable协议
//        XCTAssertEqual(item.location, location, "Should set location")
        XCTAssertEqual(item.location?.name, location.name, "Should set location")
    }
    
    func test_EqualItems_AreEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")
        
        XCTAssertEqual(first, second)
    }
    
    func test_Items_WhenLocationDiffers_AreNotEuqal() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: Location(name: "Bar"))
        
        XCTAssertNotEqual(first, second)
    }
}
