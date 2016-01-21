//
//  ViewController.swift
//  TaskIt
//
//  Created by Agrim Singh on 20/1/16.
//  Copyright © 2016 Agrim Singh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchedResultsController = getFetchedResultsController()
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch _ {
            
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("You have clicked row: " + "\(indexPath.row)")
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        print("Hey, something has changed!")
        tableView.reloadData()
    }
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortdescriptor1 = NSSortDescriptor(key: "date", ascending: true)
        let sortdescriptor2 = NSSortDescriptor(key: "isCompleted", ascending: true)
        fetchRequest.sortDescriptors = [sortdescriptor2, sortdescriptor1] //order matters
        
        return fetchRequest
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }

    @IBOutlet var tableView: UITableView!
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    func getFetchedResultsController() -> NSFetchedResultsController {
        fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "isCompleted", cacheName: nil)
        return fetchedResultsController
    }
    
}

