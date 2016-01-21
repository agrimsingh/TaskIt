//
//  TaskModel+CoreDataProperties.swift
//  TaskIt
//
//  Created by Agrim Singh on 20/1/16.
//  Copyright © 2016 Agrim Singh. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TaskModel {

    @NSManaged var isCompleted: NSNumber?
    @NSManaged var task: String?
    @NSManaged var subtask: String?
    @NSManaged var date: NSDate?

}
