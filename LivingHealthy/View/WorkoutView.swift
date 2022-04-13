import SwiftUI

struct WorkoutView: View {
    let workout: Workout
    
    var body: some View {

        // gets youtube video from database and implements into each workout view
            VStack {
                VideoView(videoID: workout.ytURL)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width-50, height: 200)
                    .clipped()
            }
            
            //gets name of workout
            VStack {
                HStack {
                    Text(workout.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Text(String(workout.time) + " mins")
                        .font(.subheadline)
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(workout.instructor)
                        .padding(.trailing)
                    Text(workout.type.rawValue)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom, 1)
                
                HStack {
                    ForEach(workout.tags, id: \.self) { tag in
                        Text(tag)
                            .encapulate(color: .black.opacity(0.8), foregroundColor : .white)
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .frame(width: UIScreen.main.bounds.width-50)
        }
    }

