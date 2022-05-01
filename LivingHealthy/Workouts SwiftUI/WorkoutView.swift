//
//  WorkoutView.swift
//  LivingHealthy
//
//  Created by Rachael Hanson
//

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
            
            
            //gets name of workout
            VStack {
                HStack {
                    Text(workout.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Text(workout.time.rawValue)
                        .font(.subheadline)
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 0) {
                    Image(systemName: "person.circle")
                        .foregroundColor(.orange)
                    Text(workout.instructor)
                        .padding(.trailing)
                    Text(workout.type.rawValue)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(workout.challenge.rawValue)
                        .foregroundColor(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                }
                .padding(.bottom, 1)
                
                //the tags for each workout displayed in elipsis
                HStack {
                    ForEach(workout.tags, id: \.self) { tag in
                        Text(tag)
                            .encapulate(color: Color(red: 0.4627, green: 0.8392, blue: 1.0).opacity(0.8), foregroundColor : .white)
                    }
                    Spacer()
                }
                .padding(.bottom)
               
            }
            .frame(width: UIScreen.main.bounds.width-50)
            
        }
    }
}
