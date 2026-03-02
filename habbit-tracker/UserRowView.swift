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
            VStack(alignment: .leading, spacing: 16) {
                
                // MARK: - Header
                Text(user.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Divider()
                
                // MARK: - Add Habit Card
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        
                        TextField("Habit name", text: $newHabitName)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        TextField("Target", text: $newTarget)
                            .keyboardType(.numberPad)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .frame(width: 80)
                        
                        Button(action: addHabit) {
                            Image(systemName: "plus")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 36, height: 36)
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.blue, .purple],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                )
                        }
                    }
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
