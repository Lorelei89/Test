//
//  DataSource.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

enum DataSource {
    case contentful
    
    static func getProvider(source: DataSource) -> DataProtocol {
        switch source {
        case .contentful:
            return DataProvider()
        }
    }
}

