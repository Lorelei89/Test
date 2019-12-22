//
//  RecipesListViewController.swift
//  MarleySpoonTest
//
//  Created by Sabina Buruiana on 12/21/19.
//  Copyright © 2019 Sabina Buruiana. All rights reserved.
//
import UIKit

class RecipesListViewController: BaseViewController {    
    private enum Segues: String {
        case detail
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    private let viewModel = RecipesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib.init(nibName: RecipeTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.nibName)
        
        reload()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.detail.rawValue , let indexPath = sender as? NSIndexPath {
            let vc = segue.destination as? RecipeViewController
            vc?.recipe = viewModel.item(atIndex: indexPath.row)
        }
    }
}

extension RecipesListViewController {
    @objc private func reload() {
        refreshControl.beginRefreshing()
        viewModel.load { (error) in
            self.refreshControl.endRefreshing();
            if let error = error {
                self.showError(error)
                return
            }
            self.tableView.reloadData()
        }
    }
}

extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.nibName) as? RecipeTableViewCell
        cell?.recipe = viewModel.item(atIndex: indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Segues.detail.rawValue, sender: indexPath)
    }
}
