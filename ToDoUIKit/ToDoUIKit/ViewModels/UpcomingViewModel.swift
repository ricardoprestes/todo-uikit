//
//  UpcomingViewModel.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 06/10/25.
//

import Foundation
import UIKit

class UpcomingViewModel {
    private let repository = ToDoRepository()
    private(set) var groupedItems: [(date: Date, items: [ToDoItem])] = []
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        let allItems: [ToDoItem] = repository.fetchUpcoming()
        
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: allItems) { item -> Date in
            calendar.startOfDay(for: item.date ?? Date())
        }
        
        groupedItems = grouped
            .map { (key, value) in (date: key, items: value.sorted(by: { $0.date ?? Date() < $1.date ?? Date() }))}
    }
    
    func numberOfSections() -> Int {
        return groupedItems.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return groupedItems[section].items.count
    }
    
    func item(at indexPath: IndexPath) -> ToDoItem {
        return groupedItems[indexPath.section].items[indexPath.row]
    }
    
    func titleForSection(_ section: Int) -> String {
        let date = groupedItems[section].date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
