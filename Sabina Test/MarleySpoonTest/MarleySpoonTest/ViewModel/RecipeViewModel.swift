//
//  RecipeViewModel.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import UIKit

class RecipeViewModel: NSObject {
    
    var recipe: RecipeModel?

    var tagsAsConcatenatedString: String {
        if let tags = recipe?.tags {
            var tagsString  = ""
            for tag in tags {
                tagsString += tag.name+", "
            }
            return String(tagsString.prefix(tagsString.count-2))
        }
        return ""
    }
}
