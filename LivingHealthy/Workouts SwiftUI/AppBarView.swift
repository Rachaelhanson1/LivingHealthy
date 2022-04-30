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
                
                if showSearchBar {
                    SearchBarView
                        .transition(.move(edge: .top))
                } else {
                }
                 
                Spacer()
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSearchBar.toggle()
                            inputText = ""
                        }
                    }
            }
            .font(.system(size: 25))
            .frame(height: 50)
            
            //horizontal scroll to allow for many different filter and sort options
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    Text(viewModel.nameSort.rawValue)
                        .encapulate(borderColor: .gray)
                        .onTapGesture {
                            if (viewModel.nameSort == .nameASC){
                                viewModel.nameSort = .nameDESC
                            } else {
                                viewModel.nameSort = .nameASC
                            }
                            viewModel.sortList(by: viewModel.nameSort)
                        }
                    Text(viewModel.timeSort.rawValue)
                        .encapulate(borderColor: .gray)
                        .onTapGesture {
                            if (viewModel.timeSort == .timeASC){
                                viewModel.timeSort = .timeDESC
                            } else {
                                viewModel.timeSort = .timeASC
                            }
                            viewModel.sortList(by: viewModel.timeSort)
                        }
                    
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
                   .encapulate(borderColor: .gray)
                    
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
                    .encapulate(borderColor: .gray)
 
                
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
               .encapulate(borderColor: .gray)
                .padding(.vertical, 3)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 100)
    }

}
