//
//  ViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 20/09/25.
//

import UIKit

class UpcomingTableViewController: UITableViewController {

    private let viewModel = UpcomingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        tableView.register(ItemViewCell.self, forCellReuseIdentifier: ItemViewCell.identifier)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemViewCell.identifier, for: indexPath) as? ItemViewCell else {
            return UITableViewCell()
        }
        
        let item = viewModel.item(at: indexPath)
        cell.configure(item: item)
        
        cell.onToggle = { [weak self] in
            self?.viewModel.toggleDone(for: item)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = viewModel.item(at: indexPath)
        let viewController = ToDoItemFormViewController(item: item)
        openFormViewController(viewController)
    }
    
    func openFormViewController(_ viewController: ToDoItemFormViewController) {
        viewController.onSave = { [weak self]  in
            guard let self = self else { return }
            self.viewModel.fetchItems()
            self.tableView.reloadData()
        }
        
        let navController = UINavigationController(rootViewController: viewController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func addItem() {
        let viewController = ToDoItemFormViewController()
        
        openFormViewController(viewController)
    }
}

