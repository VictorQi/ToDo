//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Victor on 2017/4/13.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import UIKit

enum Section: Int {
    case todo
    case done
}

class ItemListDataProvider: NSObject {
    var itemManager: ItemManager?
}

extension ItemListDataProvider: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else {
            return 0
        }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        
        let numberOfRows: Int
        switch itemSection {
        case .todo:
            numberOfRows = itemManager.toDoCount
        case .done:
            numberOfRows = itemManager.doneCount
        }

        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ItemCell()
    }
}

extension ItemListDataProvider: UITableViewDelegate {
    
}
