//
//  ContentfulProvider.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import Contentful

class DataProvider: DataProtocol {
    static private let spaceId = "kk2bw5ojx476"
    static private let accessToken = "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c"
    
    private let client = Client(spaceId: spaceId,
                               accessToken: accessToken,
                               contentTypeClasses: [ContentfulRecipe.self, ContentfulChef.self, ContentfulTag.self])
    
    private func fetchArray<T: EntryDecodable & FieldKeysQueryable>(of type: T.Type, _ completion: @escaping (_ items: [T]?, _ error: Error?) -> Void) {
        client.fetchArray(of: T.self) { (result) in
            switch result {
            case .success(let entriesArrayResponse):
                DispatchQueue.main.async {
                    completion(entriesArrayResponse.items, nil)
                }
            case .error(let error):
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchRecipes(completion: @escaping ([RecipeModel]?, Error?) -> Void) {
        fetchArray(of: ContentfulRecipe.self) { (items, error) in
            completion(items, error)
        }
    }
}
