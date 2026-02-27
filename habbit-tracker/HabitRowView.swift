//
//  HabitRowView.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import SwiftUI

struct HabitRowView: View {
    
    @Binding var habit: Habit
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                TextField("Habit", text: $habit.name)
                
                Button("--") {
                    if habit.progress > 0 {
                        habit.progress -= 1
                    }
                }
                
                Text("\(habit.progress)/\(habit.target)")
                
                Button("++") {
                    if habit.progress < habit.target {
                        habit.progress += 1
                    }
                }
            }
            
            Toggle("Completed", isOn: $habit.isCompleted)
            
            ProgressView(
                value: Double(habit.progress),
                total: Double(habit.target)
            )
        }
        .padding(.vertical, 5)
    }
}
