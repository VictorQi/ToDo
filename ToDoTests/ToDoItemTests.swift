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

        XCTAssertEqual(item.location, location, "Should set location")
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
    
    func test_Items_WhenOneHasLocationAnotherIsNil_AreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: nil)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTimestampDiffers_AreNotEqual() {
        let first = ToDoItem(title: "Foo", timestamp: 1.0)
        let second = ToDoItem(title: "Foo", timestamp: 2.0)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenDescriptionDiffers_AreNotEqual() {
        let first = ToDoItem(title: "Foo", itemDescription: "Bar")
        let second = ToDoItem(title: "Foo", itemDescription: "Baz")
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTitleDiffers_AreNotEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Boo")
        
        XCTAssertNotEqual(first, second)
    }
}
