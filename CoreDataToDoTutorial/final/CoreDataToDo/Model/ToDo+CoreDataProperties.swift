//
//  ToDo+CoreDataProperties.swift
//  CoreDataToDo
//
//  Created by Kenta Kodashima on 2019-03-15.
//  Copyright © 2019 Kenta Kodashima. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var todoName: String
    @NSManaged public var todoDescription: String
    @NSManaged public var todoImage: NSData?
    @NSManaged public var dateCreated: NSDate

}
