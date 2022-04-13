import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    
    @State var inputText = ""
    @State var selectedLevel = Level.all
    @State var isWeights = false
    
    var body: some View {
        VStack {
            
            //bar at the top for searching and filtering
            AppBarView(inputText: $inputText, selectedLevel: $selectedLevel, isWeights: $isWeights)
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
                        filterOnSale(workout)
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
    
    private func filterOnSale(_ workout: Workout) -> Bool {
        if !isWeights || workout.tags.firstIndex(of: "Weight") != nil {
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
