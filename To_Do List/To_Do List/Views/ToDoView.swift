//
//  ToDoView.swift
//  To_Do List
//
//  Created by Deepak Behera on 07/02/24.
//

import SwiftUI
import SwiftData


struct ToDoView: View {
    var item: TodoItem
    
    var body: some View {
        HStack {
            Text(item.title)
                .font(.title3)
                .foregroundStyle(item.completed ? .black : .gray)
            
            Spacer()
            
            Button {
                item.completed.toggle()
            } label: {
                Image(systemName: item.completed ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .foregroundStyle(item.completed ? .green : .gray)
        }
    }
}
