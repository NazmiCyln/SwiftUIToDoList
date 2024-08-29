//
//  LoginView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    Spacer().frame(height: 20)
                    HeaderView(
                        title: "To Do List",
                        subtitle: "Get things done",
                        angle: 15,
                        background: .pink
                    )

                    VStack(spacing: 20) {

                        Spacer().frame(height: 10)

                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }

                        VStack {
                            TextField("Email Address", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                                .frame(height: Constants().fieldHeight)
                                .textInputAutocapitalization(.never)

                            Divider()

                            SecureField("Password", text: $viewModel.password)
                                .frame(height: Constants().fieldHeight)
                                .textInputAutocapitalization(.never)

                            Divider()

                            TLButton(
                                title: "Log In",
                                background: .blue
                            ) {
                                viewModel.login()
                            }
                        }
                        .padding()
                        .background(Color("FieldBg"))
                        .clipShape(.rect(cornerRadius: 12))

                        VStack(){
                            Spacer().frame(height: 10)
                            Text("New arround here?")

                            NavigationLink("Create An Account") {
                                RegisterView()
                            }
                            Spacer().frame(height: 10)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color("FormBg"))
                    .offset(y: -70)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
