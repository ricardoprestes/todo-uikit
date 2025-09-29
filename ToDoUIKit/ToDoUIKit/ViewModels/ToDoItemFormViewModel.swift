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
    var date: Date? = nil
    
    private let repository = ToDoRepository()
    
    func toModel(item: ToDoItem? = nil) -> ToDoItem {
        if let item = item {
            return ToDoItem(
                id: item.id,
                title: title,
                observation: observation,
                date: date,
                done: item.done
            )
        } else {
            return ToDoItem(
                title: title,
                observation: observation,
                date: date,
                done: false
            )
        }
    }
    
    func save(item: ToDoItem? = nil) {
        let newItem = toModel(item: item)
        repository.save(newItem)
    }
}
