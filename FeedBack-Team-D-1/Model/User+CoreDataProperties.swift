//
//  User+CoreDataProperties.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var userScore: UserScore?
    @NSManaged public var userSurveyServices: UserSurveyServices?

}

extension User : Identifiable {

}
