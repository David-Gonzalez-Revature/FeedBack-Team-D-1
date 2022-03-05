//
//  UserScoreGifts+CoreDataProperties.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
//
//

import Foundation
import CoreData


extension UserScoreGifts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserScoreGifts> {
        return NSFetchRequest<UserScoreGifts>(entityName: "UserScoreGifts")
    }

    @NSManaged public var code: Int32
    @NSManaged public var dateCreated: Date?
    @NSManaged public var descriptionGift: String?

}

extension UserScoreGifts : Identifiable {

}
