//
//  ContentView.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var newUserName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                AddUserView(
                    name: $newUserName,
                    addAction: addUser
                )
                
                List {
                    ForEach($users) { $user in
                        UserRowView(user: $user)
                    }
                    .onDelete(perform: deleteUser)
                }
                
                AppStatsView(users: users)
            }
            .navigationTitle("Habit Tracker")
            .padding()
        }
    }
    
    private func addUser() {
        guard !newUserName.isEmpty else { return }
        
        users.append(User(name: newUserName, habits: []))
        newUserName = ""
    }
    
    private func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
