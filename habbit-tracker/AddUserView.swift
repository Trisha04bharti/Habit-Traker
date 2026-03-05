//
//  AddUserView.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import SwiftUI

struct AddUserView: View {
    
    @Binding var name: String
    var addAction: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            
            // User Name Field
            HStack {
                Image(systemName: "person.fill")
                    .foregroundStyle(.gray)
                
                TextField("User Name", text: $name)
            }
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Add Button
            Button(action: addAction) {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.4),
                            radius: 4,
                            x: 0,
                            y: 2)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06),
                radius: 8,
                x: 0,
                y: 4)
        .padding(.horizontal)
    }
}
