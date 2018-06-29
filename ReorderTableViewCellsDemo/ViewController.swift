//
//  ViewController.swift
//  ReorderTableViewCellsDemo
//
//  Created by Yaswanth on 29/06/18.
//  Copyright © 2018 Yash Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var fruitsTbl : UITableView!
    var fruitsArr = ["Mango", "Banana", "Apple", "Custard apple", "Pineapple", "Orange", "Grapes", "Kiwifruit", "Jackfruit", "Mudapples"]
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsTbl.tableFooterView = UIView()
        fruitsTbl.isEditing = !fruitsTbl.isEditing
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        cell.textLabel?.text = fruitsArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    //MARK: TableView Delegate Methods
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = fruitsArr[sourceIndexPath.row]
        fruitsArr.remove(at: sourceIndexPath.row)
        fruitsArr.insert(movedObject, at: destinationIndexPath.row)
    }

}

