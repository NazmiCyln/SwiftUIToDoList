import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
            } else {
                LoginView()
            }
        }
    }

    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
