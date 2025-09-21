//
//  Item.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import Foundation

struct Item: Identifiable, Codable, Equatable
{
    let id: UUID
    var title: String
    var observation: String
    var date: Date
    var isFinished: Bool
    
    init(
        id: UUID = UUID(),
        title: String,
        observation: String = "",
        date: Date = Date(),
        isFinished: Bool = false
    ) {
        self.id = id
        self.title = title
        self.observation = observation
        self.date = date
        self.isFinished = isFinished
    }
}
