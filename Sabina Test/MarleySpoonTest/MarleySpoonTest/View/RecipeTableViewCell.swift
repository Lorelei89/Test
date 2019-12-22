//
//  RecipeTableViewCell.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    static var nibName = "RecipeTableViewCell"
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var recipe: RecipeModel? {
        didSet {
            titleLabel.text = recipe?.title
            
            thumbImageView.image = nil
            recipe?.getImage({ (image) in
                self.thumbImageView.image = image

            })
        }
    }
}
