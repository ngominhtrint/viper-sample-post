//
//  PostModel.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/20/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostModel {
    var id = 0
    var title = ""
    var imageUrl = ""
    var thumbImageUrl = ""
}

extension PostModel: Mappable {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        imageUrl <- map["url"]
        thumbImageUrl <- map["thumbUrl"]
    }
}
