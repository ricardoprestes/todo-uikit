//
//  ToDoRepository.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 22/09/25.
//

import Foundation

struct ToDoRepository {
    private let key = "ToDoItems"

    func save(_ items: [ToDoItem]) {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("❌ Erro ao salvar ToDoItems: \(error)")
        }
    }

    func load() -> [ToDoItem] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            print("❌ Erro ao carregar ToDoItems: \(error)")
            return []
        }
    }
}

