//
//  IconData+CoreDataProperties.swift
//  
//
//  Created by 玉川悠真 on 2023/05/01.
//
//

import Foundation
import CoreData


extension IconData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IconData> {
        return NSFetchRequest<IconData>(entityName: "IconData")
    }

    @NSManaged public var imageData: Data?

}

extension IconData{
    public var wrappedImg: Data {imageData ?? Data.init(capacity: 0)}
}


extension IconData : Identifiable {

}
