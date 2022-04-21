import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    
    let beg = begButton.beginnerButton

//    if beg.value == 1 {
//        x = beginner
//    }
//    else if inter == 1 {
//        x = intermediate
//    }
//    else if advan == 1 {
//        x = advanced
//    }
//    else{}
    let c = adButton
    
    var advancedbutton = 1
        
    @State var selectedLevel = Level.all
    
    @State var inputText = ""
    //change this depending on user level
    @State var selectedExercise = Exercise.all
//    @State var selectedTag = tags
    
    
    var body: some View {
        VStack {
            
            //bar at the top for searching and filtering
            AppBarView(inputText: $inputText, selectedLevel: $selectedLevel, selectedExercise: $selectedExercise)
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

    }

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
