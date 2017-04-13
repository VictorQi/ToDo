//
//  ItemListViewControllerTest.swift
//  ToDo
//
//  Created by Victor on 2017/4/13.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTest: XCTestCase {
    var sut: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = vc as! ItemListViewController
        
        _ = sut.view // 用来触发对viewDidLoad()的调用，不能直接调用viewDidLoad()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDataSourceAndDelegate_ToSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
    }
}
