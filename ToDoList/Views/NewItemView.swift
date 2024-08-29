//
//  NewItemView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool

    let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
                .padding(.top, 10)

            Form{
                TextField("Title", text: $viewModel.title)
                    .frame(height: Constants().fieldHeight)

                DatePicker("Due Date", selection: $viewModel.dueDate, in: startDate...)
                    .datePickerStyle(.graphical)

                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer.")
                )
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
