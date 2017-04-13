//
//  ItemManager.swift
//  ToDo
//
//  Created by Victor on 2017/4/12.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count }
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    func add(_ item: ToDoItem) {
        guard !(toDoItems.contains(item)) else {
            return
        }
        toDoItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem? {
        guard 0..<toDoItems.count ~= index else {
            return nil
        }
        return toDoItems[index]
    }
    
    func checkItem(at index: Int) -> ToDoItem? {
        // TODO: index boundary check
        guard 0..<toDoItems.count ~= index else {
            return nil
        }
        
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
        return item
    }
    
    func doneItem(at index: Int) -> ToDoItem? {
        // TODO: index boundary check
        guard 0..<doneItems.count ~= index else {
            return nil
        }
        
        return doneItems[index]
    }
    
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
