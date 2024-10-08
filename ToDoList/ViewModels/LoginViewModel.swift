//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {

  @Published var email: String = ""
  @Published var password: String = ""
  @Published var errorMessage: String = ""

    init() {}

    func login() {
        guard validate() else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password)
    }

    private func validate() -> Bool{
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {

            errorMessage = "Please fill in all fields."
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
