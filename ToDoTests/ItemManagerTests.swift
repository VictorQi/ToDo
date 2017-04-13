//
//  ItemManagerTests.swift
//  ToDo
//
//  Created by Victor on 2017/4/12.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!
    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ToDoCount_Initially_IsZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_DoneCount_Initially_IsZero() {
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_AddItem_IncreasesToDoCountToOne() {
        sut.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(sut.toDoCount, 1)
    }
    
    func test_ItemAt_AfterAddingAnItem_ReturnsThatItem() {
        let item = ToDoItem(title: "Foo")
        sut.add(item)
        
        let returnedItem = sut.item(at: 0)
        XCTAssertEqual(returnedItem, item)
    }
    
    func test_CheckItemAt_ChangesCount() {
        sut.add(ToDoItem(title: "Foo"))
        
        _ = sut.checkItem(at: 0)
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    func test_CheckItemAt_RemoveItFromToDoItems() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "Second")
        sut.add(first)
        sut.add(second)
        
        _ = sut.checkItem(at: 0)
        XCTAssertEqual(sut.item(at: 0), second)
    }
    
    func test_DoneItemAt_ReturnsCheckedItem() {
        let first = ToDoItem(title: "first")
        sut.add(first)
        
        _ = sut.checkItem(at: 0)
        let doneItem = sut.doneItem(at: 0)
        XCTAssertEqual(doneItem, first)
    }
    
    func test_RemoveAll_ResultsInCountsBeZero() {
        let first = ToDoItem(title: "first")
        let second = ToDoItem(title: "second")
        
        sut.add(first)
        sut.add(second)
        _ = sut.checkItem(at: 1)
        
        XCTAssertEqual(sut.doneCount, 1)
        XCTAssertEqual(sut.toDoCount, 1)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.doneCount, 0)
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_Add_WhenItemIsAlreadyContained_DoesNotIncreaseCount() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "First")
        XCTAssertEqual(first, second)
        
        sut.add(first)
        sut.add(second)
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
