//
//  ContentfulTag.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import Contentful

class ContentfulTag: TagModel, EntryDecodable, FieldKeysQueryable  {
    static var contentTypeId: ContentTypeId = "tag"
    
    enum FieldKeys: String, CodingKey {
        case id, name
    }
    
    var id: String
    var updatedAt: Date?
    var createdAt: Date?
    var localeCode: String?
    
    var name: String
    
    public required init(from decoder: Decoder) throws {
        let sys = try decoder.sys()
        id = sys.id
        
        let fields = try? decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        name = try fields?.decode(String.self, forKey: FieldKeys.name) ?? ""
    }
}

