//
//  ContentView.swift
//  Learners
//
//  Created by Srinidhi Narendran on 16/10/2026.
//

import SwiftUI

struct ContentView: View {
    
    var learnerViewModel = LearnersViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(learnerViewModel.learners) {
                    learner in
                    
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(learner.colour)
                        Text(learner.name + " " + learner.surname)
                        Text(learner.emoji)
                    }
                }
            }.navigationTitle("Learners")
        }
    }
}

#Preview {
    ContentView()
}
