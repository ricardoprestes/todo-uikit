//
//  ToDoRepository.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 22/09/25.
//

import Foundation

struct ToDoRepository {
    private let key = "ToDoItems"

    func save(_ item: ToDoItem) {
        var items = fetch()
        if let index = items.firstIndex(of: item) {
            items[index] = item
        } else {
            items.append(item)
        }
        save(items)
    }
    
    private func save(_ items: [ToDoItem]) {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("❌ Erro ao salvar ToDoItems: \(error)")
        }
    }

    func fetchInbox() -> [ToDoItem] {
        let allItems = fetch()
        return allItems.filter { !$0.done && $0.date == nil }
    }
    
    func fetchToday() -> [ToDoItem] {
        let allItems = fetch()
        let today = Calendar.current.startOfDay(for: Date())
        
        return allItems.filter{ item in
            guard !item.done, let itemDate = item.date else { return false }
            return Calendar.current.isDate(itemDate, inSameDayAs: today)
        }
    }

    
    func toggleDone(for item: ToDoItem) {
        var items = fetch()
        guard let index = items.firstIndex(where: {$0.id == item.id}) else { return }
        items[index].done.toggle()
        save(items)
    }
    
    private func fetch() -> [ToDoItem] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            let items = try JSONDecoder().decode([ToDoItem].self, from: data)
            return items
        } catch {
            print(error)
            return []
        }
    }
}

