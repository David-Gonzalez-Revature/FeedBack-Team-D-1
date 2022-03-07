//
//  UserScore+CoreDataProperties.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
//
//

import Foundation
import CoreData


extension UserScore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserScore> {
        return NSFetchRequest<UserScore>(entityName: "UserScore")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var email: String?
    @NSManaged public var score: Int32
    @NSManaged public var userScoreGifts: UserScoreGifts?

}

extension UserScore : Identifiable {

}
