//
//  UserRowView.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import SwiftUI

struct UserRowView: View {
    
    @Binding var user: User
    
    @State private var newHabitName: String = ""
    @State private var newTarget: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(user.name)
                .font(.headline)
            
            // Add Habit Section
            HStack {
                TextField("Habit", text: $newHabitName)
                TextField("Target", text: $newTarget)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                
                Button("Add") {
                    addHabit()
                }
            }
            
            // Habit List
            ForEach($user.habits) { $habit in
                HabitRowView(habit: $habit)
            }
            .onDelete(perform: deleteHabit)
            
            UserStatsView(habits: user.habits)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
    
    private func addHabit() {
        guard let target = Int(newTarget),
              !newHabitName.isEmpty else { return }
        
        user.habits.append(
            Habit(name: newHabitName,
                  target: target,
                  progress: 0,
                  isCompleted: false)
        )
        
        newHabitName = ""
        newTarget = ""
    }
    
    private func deleteHabit(at offsets: IndexSet) {
        user.habits.remove(atOffsets: offsets)
    }
}
