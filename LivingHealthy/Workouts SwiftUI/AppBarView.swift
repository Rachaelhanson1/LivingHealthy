//
//  AppBarView1.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 30/04/2022.
//
import SwiftUI

struct AppBarView: View {
    @EnvironmentObject var viewModel: ListViewModel
    @State var showSearchBar = true
    @Binding var inputText: String
    @Binding var selectedLevel: Level
    @Binding var selectedExercise: Exercise
    @Binding var selectedChallenge: Challenge
    @Binding var selectedTime: Time

    
    
    var SearchBarView: some View {
        VStack {
            TextField("Search something...", text: $inputText)
                .padding(5)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 3)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                SearchBarView
                Spacer()
                Image(systemName: "magnifyingglass")
            }

            .font(.system(size: 25))
            .frame(height: 50)
            
            //horizontal scroll to allow for many different filter and sort options
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    //select level type filter
                    Picker(selectedLevel.rawValue,
                           selection: $selectedLevel) {
                        ForEach(Level.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                    .colorMultiply(.black)
                    .pickerStyle(.menu)
                    .padding(.vertical, -5)
                    .encapulate(borderColor: .black)
                    
                    
                    //select exercise type filter
                    Picker(selectedExercise.rawValue,
                           selection: $selectedExercise) {
                        ForEach(Exercise.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                    .colorMultiply(.black)
                    .pickerStyle(.menu)
                    .padding(.vertical, -5)
                    .encapulate(borderColor: .black)
 
                
                    //select challenge time duration filter
                    Picker(selectedTime.rawValue,
                           selection: $selectedTime) {
                        ForEach(Time.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                       .colorMultiply(.black)
                       .pickerStyle(.menu)
                       .padding(.vertical, -5)
                       .encapulate(borderColor: .black)
                       .padding(.vertical, 3)
                        
                        
                    //select challenge level type filter
                    Picker(selectedChallenge.rawValue,
                           selection: $selectedChallenge) {
                        ForEach(Challenge.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                        .colorMultiply(.black)
                        .pickerStyle(.menu)
                        .padding(.vertical, -5)
                        .encapulate(borderColor: .black)
                        .padding(.vertical, 3)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 100)
    }

}


