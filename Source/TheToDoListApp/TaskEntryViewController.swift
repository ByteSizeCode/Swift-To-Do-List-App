//
//  TaskEntryController.swift
//  VegaScrollFlowLayout_Example
//
//  Created by Isaac Raval on 3/28/19.
//  Copyright © 2019. All rights reserved.
//

//import Foundation
import UIKit

class TaskEntryViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var taskCatagory: UITextField!
    
    
@IBAction func submitTaskInfo(_ sender: UIButton) {
    //set values
    FeedViewController.publicVars.taskNameValue = taskName.text!
    FeedViewController.publicVars.taskCatagoryValue = taskCatagory.text!
    
    //Get formatted current date
    let dateformatter = DateFormatter()
    dateformatter.dateStyle = DateFormatter.Style.medium
    dateformatter.timeStyle = DateFormatter.Style.short
    let now = dateformatter.string(from: Date()) //as string
    //convert to date
    let strToDateConv = dateformatter.date(from: now)
    
    print("Storing date as \(strToDateConv)")
    
    //add task to array
    FeedViewController.vars.tasks.append((toDoItem(name: FeedViewController.publicVars.taskNameValue, category: FeedViewController.publicVars.taskCatagoryValue, date: strToDateConv!, finishedStatus: "", isDone: false)))

    //Go back to previous view controller
     dismiss(animated: true, completion: nil)
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
