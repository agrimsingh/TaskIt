//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Agrim Singh on 20/1/16.
//  Copyright © 2016 Agrim Singh. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModel:TaskModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskTextField.text = detailTaskModel.task
        subtaskTextField.text = detailTaskModel.subtask
        datePicker.date = detailTaskModel.date!
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
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        
    self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    @IBAction func updateButtonPressed(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = datePicker.date
        
        appDelegate.saveContext()
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
