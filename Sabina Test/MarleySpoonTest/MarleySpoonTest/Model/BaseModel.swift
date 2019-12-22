//
//  BaseModel.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

protocol BaseModel: Decodable {
    var id: String { get set }
}
