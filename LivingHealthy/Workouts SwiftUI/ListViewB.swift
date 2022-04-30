//
//  ListViewB.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 30/04/2022.
//

import SwiftUI

struct ListViewB: View {
    @ObservedObject var viewModel = ListViewModel()
  
    @State var inputText = ""
    //change this depending on user level
    @State var selectedLevel = Level.beginner
    @State var selectedExercise = Exercise.all
    @State var selectedChallenge = Challenge.all

    
    
    var body: some View {
        VStack {
            
            //bar at the top for searching and filtering
            AppBarView(inputText: $inputText, selectedLevel: $selectedLevel, selectedExercise: $selectedExercise, selectedChallenge: $selectedChallenge)
                .environmentObject(viewModel)
                .padding(.bottom, 5)
                .overlay(Divider()
                            .frame(width: UIScreen.main.bounds.width)
                            .background(Color.black), alignment: .bottom)
                .padding(.bottom, 5)
                
            //scroll for each of the workouts
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.workouts.filter({ workout in
                        filterSearchText(workout)
                    }).filter({ workout in
                        filterLevel(workout)
                    }).filter({ workout in
                        filterExercise(workout)
                    }).filter({ workout in
                        filterChallenge(workout)
                        
                    }), id: \.self) { workout in
                        WorkoutView(workout: workout)
                    }
                }
            }
        }
    }
    
    private func filterSearchText(_ workout: Workout) -> Bool {
        if inputText == "" || workout.name.localizedCaseInsensitiveContains(inputText) {
            return true
        } else {
            return false
        }
    }
    
    private func filterLevel(_ workout: Workout) -> Bool {
        if selectedLevel == .all || selectedLevel == workout.type
        {
            return true
        } else {
            return false
        }
    }
    private func filterExercise(_ workout: Workout) -> Bool {
        if selectedExercise == .all || selectedExercise == workout.exercise
        {
            return true
        } else {
            return false
        }
    }
    private func filterChallenge(_ workout: Workout) -> Bool {
        if selectedChallenge == .all || selectedChallenge == workout.challenge
        {
            return true
        } else {
            return false
        }
    }
}

struct ListView_PreviewsB: PreviewProvider {
    static var previews: some View {
        ListViewB()
    }
}
