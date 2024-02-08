//
//  TodoItem.swift
//  To_Do List
//
//  Created by Deepak Behera on 07/02/24.
//

import SwiftData
import Foundation

@Model
final class TodoItem {
    var title: String
    var completed: Bool
    var timestamp: Date
    
    init(
        title: String,
        completed: Bool,
        timestamp: Date
    ) {
        self.timestamp = timestamp
        self.title = title
        self.completed = completed
    }
}
