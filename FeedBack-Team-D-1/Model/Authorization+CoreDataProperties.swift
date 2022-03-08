//
//  Authorization+CoreDataProperties.swift
//  FeedBack-Team-D-1
//
//  Created by John Figueroa on 3/7/22.
//
//

import Foundation
import CoreData


extension Authorization {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Authorization> {
        return NSFetchRequest<Authorization>(entityName: "Authorization")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension Authorization : Identifiable {

}
