//
//  UserStatsView.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import SwiftUI

struct UserStatsView: View {
    
    var habits: [Habit]
    
    var body: some View {
        
        let total = habits.count
        let completed = habits.filter { $0.isCompleted }.count
        
        VStack(alignment: .leading) {
            Text("Completed: \(completed)/\(total)")
            
            if total > 0 {
                ProgressView(
                    value: Double(completed),
                    total: Double(total)
                )
            }
        }
    }
}
