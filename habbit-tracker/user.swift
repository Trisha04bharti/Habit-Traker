//
//  user.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    var habits: [Habit]
}
