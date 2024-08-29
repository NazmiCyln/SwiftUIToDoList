//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]

    private let userId: String

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")

        self.userId = userId
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }

    var body: some View {
        NavigationStack {
            VStack{
                if items.isEmpty {
//                    ContentUnavailableView(
//                        "No Data",
//                        systemImage: "checklist",
//                        description: Text("Please add ToDo.")
//                    )
                    VStack(spacing: 20){
                        Image(systemName: "checklist")
                        Text("No Data")
                        Text("Please add ToDo.")
                    }
                } else {
                    List(items) { item in
                        ToDoListItemView(item: item)
                            .swipeActions{
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                    }
                    .listStyle(.plain)
                }

            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(
                    action: {
                        viewModel.showNewItemView = true
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            }
            .sheet(isPresented: $viewModel.showNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "89uY61dyuTOeM5YArBGSa10EUw33")
}
