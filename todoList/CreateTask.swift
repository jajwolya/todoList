//
//  CreateTask.swift
//  todoList
//
//  Created by trioxis on 17/2/17.
//  Copyright © 2017 trioxis. All rights reserved.
//

import UIKit

class CreateTask: UIViewController {
    
    var prevVC = ViewController()

    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var taskImportant: UISwitch!

    @IBAction func addTask(_ sender: Any) {
        let newTask = Task()
        newTask.name = taskName.text!
        newTask.important = taskImportant.isOn
        
        prevVC.tasks.append(newTask)
        prevVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
