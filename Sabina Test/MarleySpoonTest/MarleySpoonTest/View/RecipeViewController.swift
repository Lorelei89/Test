//
//  RecipeViewController.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var chefLabel: UILabel!
    @IBOutlet weak var chefNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var recipe: RecipeModel?
    var viewModel = RecipeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.recipe = recipe
        
        titleLabel.text = recipe?.title
        descriptionLabel.text = recipe?.description
        tagsLabel.text = viewModel.tagsAsConcatenatedString
        
        if let chefName = recipe?.chef?.name {
            chefNameLabel.text = chefName
        } else {
            chefLabel.isHidden = true
        }
        
        recipe?.getImage({ (image) in
            self.thumbImageView.image = image
        })
    }
}

