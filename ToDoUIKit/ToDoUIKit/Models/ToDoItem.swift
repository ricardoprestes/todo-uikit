//
//  Item.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import Foundation

struct ToDoItem: Identifiable, Codable, Equatable
{
    let id: UUID
    var title: String
    var observation: String
    var date: Date
    var done: Bool
    
    init(
        id: UUID = UUID(),
        title: String,
        observation: String = "",
        date: Date = Date(),
        done: Bool = false
    ) {
        self.id = id
        self.title = title
        self.observation = observation
        self.date = date
        self.done = done
    }
}
