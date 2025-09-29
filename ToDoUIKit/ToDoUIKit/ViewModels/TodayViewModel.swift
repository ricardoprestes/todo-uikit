//
//  TodayViewModel.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 29/09/25.
//

import Foundation

final class TodayViewModel {
    
    //MARK: - Properties
    private(set) var items: [ToDoItem] = []
    private let repository = ToDoRepository()
    
    init () {
        fetchItems()
    }
    
    //MARK: - Methods
    func fetchItems() {
        items = repository.fetchToday()
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
