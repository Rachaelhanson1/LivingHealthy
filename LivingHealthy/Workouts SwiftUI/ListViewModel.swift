//
//  ListViewModel.swift
//  LivingHealthy
//
//  Created by Rachael Hanson
//
import Foundation

class ListViewModel: ObservableObject {
    @Published var workouts = [Workout]()
    
    init() {
        workouts = loadJsonFile()
    }
    
    //importing the data for each workout from the database
    private func loadJsonFile() -> [Workout]{
        var dbData = [Workout]()
        do {
            if let filePath  = Bundle.main.url(forResource: "DBdata", withExtension: "json") {
                
                let jsonData = try Data(contentsOf: filePath)
                let decodedData = try JSONDecoder().decode([Workout].self, from: jsonData)
                print("Decoded: \(decodedData)")
                dbData = decodedData
            } else {
                return [Workout]()
            }
        } catch let error {
            print("[System] Error while fetching: \(error)")
        }
        return dbData
    }
    
}
