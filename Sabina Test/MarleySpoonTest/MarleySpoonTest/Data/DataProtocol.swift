//
//  DataProtocol.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

protocol DataProtocol {
    func fetchRecipes(completion: @escaping (_ items: [RecipeModel]?, _ error: Error?) -> Void)
}
