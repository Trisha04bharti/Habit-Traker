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
        
        VStack(alignment: .leading, spacing: 12) {
            
            // Header
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundStyle(.blue)
                
                Text("Habit Progress")
                    .font(.headline)
                
                Spacer()
                
                Text("\(completed)/\(total)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            if total > 0 {
                ProgressView(
                    value: Double(completed),
                    total: Double(total)
                )
                .progressViewStyle(.linear)
                .tint(.blue)
            }
            
            // Percentage Text
            if total > 0 {
                let percentage = Int((Double(completed) / Double(total)) * 100)
                
                Text("\(percentage)% Completed")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemGray6))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.05),
                radius: 6,
                x: 0,
                y: 3)
    }
}
