//
//  ItemListDataProviderTests.swift
//  ToDo
//
//  Created by Victor on 2017/5/20.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListDataProviderTests: XCTestCase {
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()// 我们还没有决定到底谁来设置这个manager，因此暂时没有在代码里实现
        
        tableView = UITableView()
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        sut.itemManager = nil
        tableView.dataSource = nil
        sut = nil
        tableView = nil
        
        super.tearDown()
    }
    
    func test_NumbersOfSection_IsTwo() {
        let numbersOfSection = tableView.numberOfSections
        
        XCTAssertEqual(numbersOfSection, 2)
    }
    
    func test_NumbersOfRowsInFirstSection_IsToDoCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_NumbersOfRow_InSecondSection_IsToDoneCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        _ = sut.itemManager?.checkItem(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        _ = sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()
    
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is ItemCell)
    }
}
