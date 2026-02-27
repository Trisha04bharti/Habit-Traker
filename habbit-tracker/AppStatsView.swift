//
//  AppStatsView.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//
import SwiftUI

struct AppStatsView: View {
    
    var users: [User]
    
    var body: some View {
        
        let allHabits = users.flatMap { $0.habits }
        let total = allHabits.count
        let completed = allHabits.filter { $0.isCompleted }.count
        
        VStack {
            Text("Overall Completion: \(completed)/\(total)")
            
            if total > 0 {
                ProgressView(
                    value: Double(completed),
                    total: Double(total)
                )
            }
        }
        .padding()
    }
}
