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
        items = repository.fetchInbox()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> ToDoItem {
        items[index]
    }
    
    func toggleDone(for item: ToDoItem) {
        guard let index = items.firstIndex(where: {$0.id == item.id}) else { return }
        items[index].done.toggle()
        repository.toggleDone(for: item)
    }
}
