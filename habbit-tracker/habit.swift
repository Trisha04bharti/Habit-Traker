//
//  habit.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 23/02/26.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var target: Int
    var progress: Int
    var isCompleted: Bool
}
