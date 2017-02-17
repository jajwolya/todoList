//
//  ViewController.swift
//  todoList
//
//  Created by trioxis on 17/2/17.
//  Copyright © 2017 trioxis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var indexRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexRow = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Complete Tutorial"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Excercise"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Work"
        task3.important = true
        
        return [task1, task2, task3];
    }
    
    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTask
            nextVC.prevVC = self
        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskVC
            nextVC.task = sender as! Task
            nextVC.prevVC = self
        }
    }
}

