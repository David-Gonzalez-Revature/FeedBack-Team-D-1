//
//  UserSurveyServices+CoreDataProperties.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
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
    @NSManaged public var qualification: Int32
    @NSManaged public var typeService: String?

}

extension UserSurveyServices : Identifiable {

}
