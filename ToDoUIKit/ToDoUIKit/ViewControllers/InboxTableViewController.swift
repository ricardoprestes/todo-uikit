//
//  InboxViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 20/09/25.
//

import UIKit

class InboxTableViewController: UITableViewController {

    private let itens: [Item] = [
        Item(title: "Item 1", observation: "", date: Date(), isFinished: false),
        Item(title: "Item 2", observation: "", date: Date(), isFinished: false),
        Item(title: "Item 3", observation: "", date: Date(), isFinished: false),
        Item(title: "Item 4", observation: "", date: Date(), isFinished: false),
        Item(title: "Item 5", observation: "", date: Date(), isFinished: false)
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
        
        cell.configure(item: itens[indexPath.row])
        return cell
    }


}
