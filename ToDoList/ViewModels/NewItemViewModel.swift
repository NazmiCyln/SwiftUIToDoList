//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewModel: ObservableObject{
  @Published var title: String = ""
  @Published var dueDate: Date = Date()
  @Published var errorMessage: String = ""
  @Published var showAlert: Bool = false


    init() {}

    func save() {
        guard canSave else{
            return
        }
        //Get current user id
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }

        //Create Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )


        //Save Model
        let db = Firestore.firestore()

        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary() )
    }

    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }

        //1 day = 86400 seconds
        //Dünden büyük veya düne eşit kontrolü
        guard dueDate >= Date().addingTimeInterval(-86400 + (-100)) else{
            return false
        }

        return true
    }
}
