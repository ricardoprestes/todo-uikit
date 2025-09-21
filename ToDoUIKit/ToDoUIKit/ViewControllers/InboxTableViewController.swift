//
//  InboxViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 20/09/25.
//

import UIKit

class InboxTableViewController: UITableViewController {

    private let itens = [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
        "Item 5",
        "Item 6",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(ItemViewCell.self, forCellReuseIdentifier: ItemViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itens.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemViewCell.identifier, for: indexPath) as? ItemViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(title: itens[indexPath.row])
        return cell
    }


}
