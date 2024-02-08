//
//  ContentView.swift
//  To_Do List
//
//  Created by Deepak Behera on 07/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TodoItem.timestamp, order: .reverse) private var items: [TodoItem]
    @State private var showingAlert = false
    @State private var title = ""

    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                Text("Tasks")
                List {
                    ForEach(items) { item in
                        ToDoView(item: item)
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                            .tint(.black)
                    }
                }
                Spacer()
                HStack {
                    TextField("Add Task", text: $title)
                    Button {
                        addItem()
                    } label: {
                        Text("Add")
                    }
                }
                .frame(height: 50)
                .padding(.horizontal, 20)
                .foregroundStyle(.gray)
            }
            .navigationTitle("📝To-Do List")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = TodoItem(title: title, completed: false, timestamp: Date())
            modelContext.insert(newItem)
            title = ""
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

