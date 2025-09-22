//
//  ToDoItemFormViewModel.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 22/09/25.
//

import Foundation

final class ToDoItemFormViewModel {
    var title: String = ""
    var observation: String = ""
    var date: Date = Date()
    
    private let repository = ToDoRepository()
    
    func toModel(item: ToDoItem? = nil) -> ToDoItem {
        if let item = item {
            return ToDoItem(
                id: item.id,
                title: title,
                observation: observation,
                date: date,
                isFinished: item.isFinished
            )
        } else {
            return ToDoItem(
                title: title,
                observation: observation,
                date: date,
                isFinished: false
            )
        }
    }
    
    func save(item: ToDoItem? = nil) {
        var items = repository.load()
        let newItem = toModel(item: item)
        
        if let index = items.firstIndex(where: {$0.id == newItem.id}) {
            items[index] = newItem
        } else {
            items.append(newItem)
        }
        repository.save(items)
    }
}
