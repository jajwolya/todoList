//
//  CompleteTaskVC.swift
//  todoList
//
//  Created by trioxis on 17/2/17.
//  Copyright © 2017 trioxis. All rights reserved.
//

import UIKit

class CompleteTaskVC: UIViewController {
    
    var task = Task()
    var prevVC = ViewController()

    @IBOutlet weak var taskLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            taskLabel.text = "❗️ \(task.name)"
        } else {
            taskLabel.text = task.name
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTask(_ sender: Any) {
        prevVC.tasks.remove(at: prevVC.indexRow)
        prevVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }


}
