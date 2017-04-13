//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Victor on 2017/4/13.
//  Copyright © 2017年 Victor Qi. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataProvider: ItemListDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
