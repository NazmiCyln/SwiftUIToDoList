//
//  RegisterView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        ScrollView {
            VStack{
                Spacer().frame(height: 20)
                HeaderView(
                    title: "Register",
                    subtitle: "Start organizing todos",
                    angle: -15,
                    background: .orange
                )

                VStack(spacing: 20) {
                    Spacer().frame(height: 10)

                    VStack{
                        TextField("Full Name", text: $viewModel.name)
                            .frame(height: Constants().fieldHeight)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()

                        Divider()

                        TextField("Email Address", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .frame(height: Constants().fieldHeight)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()

                        Divider()

                        SecureField("Password", text: $viewModel.password)
                            .frame(height: Constants().fieldHeight)
                            .textInputAutocapitalization(.never)

                        Divider()

                        TLButton(
                            title: "Create Account",
                            background: .green
                        ) {
                            viewModel.register()
                        }
                    }
                    .padding()
                    .background(Color("FieldBg"))
                    .clipShape(.rect(cornerRadius: 12))

                    Spacer().frame(height: 10)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width)
                .background(Color("FormBg"))
                .offset(y: -70)
            }

        }
    }
}

#Preview {
    RegisterView()
}
