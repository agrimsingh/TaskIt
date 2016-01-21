//
//  addTaskDetailViewController.swift
//  TaskIt
//
//  Created by Agrim Singh on 20/1/16.
//  Copyright © 2016 Agrim Singh. All rights reserved.
//

import UIKit
import CoreData

class addTaskDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskTextField: UITextField!

    @IBOutlet weak var subtaskTextField: UITextField!
    
    @IBAction func addTaskButtonPressed(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext)
        
        let task = TaskModel(entity:entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        task.task = taskTextField.text
        task.subtask = subtaskTextField.text
        task.date = datePicker.date
        task.isCompleted = false
        
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    
}
