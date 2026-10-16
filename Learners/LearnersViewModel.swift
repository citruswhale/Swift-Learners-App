//
//  LearnersViewModel.swift
//  Learners
//
//  Created by Srinidhi Narendran on 16/10/2026.
//

import Foundation
import SwiftUI

class LearnersViewModel {
    var learners: [Learner] = [
        Learner(name: "Srinidhi", surname: "Narendran", colour: .cyan, emoji: "😂"),
        Learner(name: "Arnav", surname: "Gupta", colour: .red, emoji: ""),
        Learner(name: "Tushar", surname: "Shaw", colour: .yellow, emoji: "✨")
    ]
}
