//
//  ToDoItem.swift
//  ToDo
//
//  Created by Victor on 2017/4/12.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    guard lhs.title == rhs.title else {
        return false
    }
    guard lhs.itemDescription == rhs.itemDescription else {
        return false
    }
    guard lhs.timestamp == rhs.timestamp else {
        return false
    }
    guard lhs.location == rhs.location else {
        return false
    }
    return true
}
