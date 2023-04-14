//
//  Member+CoreDataProperties.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/07.
//
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?

}

extension Member : Identifiable {

}
