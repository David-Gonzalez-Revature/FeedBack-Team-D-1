//
//  UserSurveyServices+CoreDataProperties.swift
//  FeedBack-Team-D-1
//
//  Created by Stephanie Marin Velasquez on 3/9/22.
//
//

import Foundation
import CoreData


extension UserSurveyServices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserSurveyServices> {
        return NSFetchRequest<UserSurveyServices>(entityName: "UserSurveyServices")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: Int32
    @NSManaged public var totalFood: Int32
    @NSManaged public var totalGym: Int32
    @NSManaged public var totalRoom: Int32
    @NSManaged public var totalScore: Int32
    @NSManaged public var typeService: String?

}

extension UserSurveyServices : Identifiable {

}
