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
    private(set) var groupedItems: [(title: String?, date: Date?, items: [ToDoItem])] = []
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        let allItems: [ToDoItem] = repository.fetchUpcoming()
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
                
        // Overdue
        let overdue = allItems.filter { calendar.startOfDay(for: $0.date!) < today }
        
        // Today
        let todayItems = allItems.filter { calendar.isDate($0.date!, inSameDayAs: today) }
        
        // Upcoming
        let upcomingItems = allItems.filter { calendar.startOfDay(for: $0.date!) > today }
        
        // Agrupar upcoming por dia
        let groupedUpcoming = Dictionary(grouping: upcomingItems) { item -> Date in
            calendar.startOfDay(for: item.date!)
        }
        .map { (key, value) in (date: key, items: value) }
        .sorted { $0.date < $1.date }
        
        // Monta estrutura final
        groupedItems = []
        
        if !overdue.isEmpty {
            groupedItems.append((title: "Overdue", date: nil, items: overdue.sorted { $0.date! < $1.date! }))
        }
        
        if !todayItems.isEmpty {
            groupedItems.append((title: "Today", date: today, items: todayItems))
        }
        
        for group in groupedUpcoming {
            groupedItems.append((title: nil, date: group.date, items: group.items))
        }
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
        if let title = groupedItems[section].title {
            return title
        }
        
        if let date = groupedItems[section].date {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
        
        return ""
    }
    
    func toggleDone(for item: ToDoItem) {
        for (sectionIndex, section) in groupedItems.enumerated() {
            if let rowIndex = section.items.firstIndex(where: { $0.id == item.id }) {
                groupedItems[sectionIndex].items[rowIndex].done.toggle()
                repository.toggleDone(for: groupedItems[sectionIndex].items[rowIndex])
                break
            }
        }
    }
}
