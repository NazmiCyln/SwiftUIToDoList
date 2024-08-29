//
//  ProfileView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                   ProgressView()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }

    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
            .padding()

        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(.vertical, 8)
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(.vertical, 8)
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.vertical, 8)
        }
        .padding()

        Button(
            action: {
                viewModel.logOut()
            },
            label: {
                Text("Log Out")
                    .bold()
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .stroke(.red, lineWidth: 4)
                    )
                    .foregroundStyle(.red)
                    .clipShape(.rect(cornerRadius: 12))
            }
        )
    }
}

#Preview {
    ProfileView()
}
