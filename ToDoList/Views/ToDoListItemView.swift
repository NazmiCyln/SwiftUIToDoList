//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()

                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))

            }
            Spacer()

            Button(
                action: {
                    viewModel.toggleIsDone(item: item)
                },
                label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.blue)
                }
            )
        }
    }
}

#Preview {
    ToDoListItemView(
        item: .init(
            id: "123a1234",
            title: "Title dfsdf af",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        )
    )
}
