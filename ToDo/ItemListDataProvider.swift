//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Victor on 2017/4/13.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject {
    
}

extension ItemListDataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ItemListDataProvider: UITableViewDelegate {
    
}
