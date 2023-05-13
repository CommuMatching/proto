//
//  Icon+CoreDataProperties.swift
//  
//
//  Created by 玉川悠真 on 2023/05/01.
//
//

import Foundation
import CoreData


extension Icon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Icon> {
        return NSFetchRequest<Icon>(entityName: "Icon")
    }

    @NSManaged public var imageData: Data?

}
