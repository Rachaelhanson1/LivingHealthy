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
                    .cornerRadius(CGFloat(5))
            
            
            //formatting the layout each of the workouts 
                VStack {
                HStack {
                    Text(workout.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Text(workout.time.rawValue)
                        .font(.subheadline)
                        .bold()
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 0) {
                    Image(systemName: "person.circle")
                        .foregroundColor(.orange)
                    Text(workout.instructor)
                        .padding(.trailing)
                        .foregroundColor(.orange)
                    Text(workout.challenge.rawValue)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(workout.type.rawValue)
                        .foregroundColor(Color(red: 0.4431, green: 0.902, blue: 0.9294))
                }
                .padding(.bottom, 1)
                
                //the tags for each workout displayed in elipsis
                HStack {
                    ForEach(workout.tags, id: \.self) { tag in
                        Text(tag)
                            .encapulate(color: Color(red: 0.9137, green: 0.2, blue: 0.3922), foregroundColor : .white)
                    }
                    Spacer()
                }
                .padding(.bottom)
               
            }
            .frame(width: UIScreen.main.bounds.width-50)
            
        }
    }
}
