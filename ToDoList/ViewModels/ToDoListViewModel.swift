//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import Foundation
import FirebaseFirestore

///ViewModel for list of items view
///Primary Tab
class ToDoListViewModel: ObservableObject {

   @Published var showNewItemView: Bool = false
    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func delete(id: String) {
        let db = Firestore.firestore()

        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
