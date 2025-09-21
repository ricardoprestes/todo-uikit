//
//  InboxViewModel.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import Foundation

final class InboxViewModel {
    
    //MARK: - Properties
    private(set) var items: [ToDoItem] = []
    
    init () {
        fetchItems()
    }
    
    //MARK: - Methods
    func fetchItems() {
        items = [
            ToDoItem(title: "Comprar pão", observation: "Na padaria da esquina", date: Date()),
            ToDoItem(title: "Estudar Swift", observation: "Revisar UITableView", date: Date()),
            ToDoItem(title: "Academia", observation: "Treino de peito", date: Date())
        ]
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> ToDoItem {
        items[index]
    }
    
    func toggleFinished(at index: Int) {
        items[index].isFinished.toggle()
    }
}
