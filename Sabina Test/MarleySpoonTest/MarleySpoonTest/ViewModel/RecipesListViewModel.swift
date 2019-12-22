//
//  RecipesListViewModel.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import UIKit

class RecipesListViewModel: NSObject {
    private var recipes: [RecipeModel] = []
    private var dataProvider: DataProtocol = DataSource.getProvider(source: .contentful)
    
    func item(atIndex index: Int) -> RecipeModel {
        return recipes[index]
    }
    
    func count() -> Int {
        return recipes.count
    }
    
    func load(_ completion: @escaping (_ error:Error?) -> Void) {
        dataProvider.fetchRecipes { (items, error) in
            guard let items = items else {
                completion(error)
                return
            }
            self.recipes = items
            completion(nil)
        }
    }
}
