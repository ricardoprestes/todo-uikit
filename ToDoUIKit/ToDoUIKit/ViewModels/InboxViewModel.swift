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
    private let repository = ToDoRepository()
    
    init () {
        fetchItems()
    }
    
    //MARK: - Methods
    func fetchItems() {
        items = repository.load()
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
    
    func addItem(_ item: ToDoItem) {
        items.append(item)
    }
}
