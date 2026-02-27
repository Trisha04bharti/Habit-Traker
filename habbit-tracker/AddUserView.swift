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
        HStack {
            TextField("User Name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            Button("Add") {
                addAction()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
