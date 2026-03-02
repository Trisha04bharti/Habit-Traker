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
       
    
                Divider()
                
                // MARK: - Habit List
                VStack(spacing: 12) {
                    ForEach($user.habits) { $habit in
                        HabitRowView(habit: $habit)
                            .padding(10)
                            .background(Color(.systemBackground))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.05),
                                    radius: 4,
                                    x: 0,
                                    y: 2)
                    }
                }
                
                Divider()
                
                // MARK: - Stats Section
                UserStatsView(habits: user.habits)
                    .padding(.top, 4)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.08),
                    radius: 10,
                    x: 0,
                    y: 4)
            .animation(.easeInOut, value: user.habits.count)
        }
    }
