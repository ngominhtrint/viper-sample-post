//
//  Post+CoreDataProperties.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/20/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import CoreData

extension Post {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }
    
    @NSManaged public var thumbImageUrl: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var id: Int32
}

