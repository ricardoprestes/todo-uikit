//
//  InboxViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 20/09/25.
//

import UIKit

class InboxTableViewController: UITableViewController {
    
    let viewModel = InboxViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(ItemViewCell.self, forCellReuseIdentifier: ItemViewCell.identifier)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemViewCell.identifier, for: indexPath) as? ItemViewCell else {
            return UITableViewCell()
        }
        
        let item = viewModel.item(at: indexPath.row)
        cell.configure(item: item)
        
        cell.onToggle = { [weak self] in
            self?.viewModel.toggleFinished(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
    
    @objc func addItem() {
        let viewController = ToDoItemFormViewController()
        
        viewController.onSave = { [weak self]  in
            guard let self = self else { return }
            self.viewModel.fetchItems()
            self.tableView.reloadData()
        }
        
        let navController = UINavigationController(rootViewController: viewController)
        present(navController, animated: true, completion: nil)
    }

}
