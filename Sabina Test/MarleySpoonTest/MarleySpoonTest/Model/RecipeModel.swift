//
//  RecipeModel.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import UIKit

protocol RecipeModel: BaseModel {    
    var title: String { get set }
    var description: String { get set }
    var chef: ChefModel? { get set }
    var tags: [TagModel]? { get set }
    
    func getImage(_ completion: @escaping (_ image: UIImage) -> Void)
}
