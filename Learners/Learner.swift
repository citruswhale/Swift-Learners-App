//
//  Learner.swift
//  Learners
//
//  Created by Srinidhi Narendran on 16/10/2026.
//

import SwiftUI
import Foundation

struct Learner: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var colour: Color
    var emoji: String
}
