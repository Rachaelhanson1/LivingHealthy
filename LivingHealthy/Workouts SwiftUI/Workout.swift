//
//  Workout.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 30/04/2022.
//

import SwiftUI

struct Workout: Codable, Hashable {
    let ytURL: String
    let type: Level
    let exercise: Exercise
    let challenge: Challenge
    let name: String
    let instructor: String
    let time: Int
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case ytURL, name, instructor, time, tags
        case type = "level"
        case exercise = "exercise"
        case challenge = "challenge"
    }
}

enum Level: String, Codable, CaseIterable {
    case all = "All levels"
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}

enum Exercise: String, Codable, CaseIterable {
    case all = "All exercises"
    case cardio = "Cardio"
    case flexibility = "Flexibility"
    case strength = "Strength Training"
    case balance = "Balance"
}

enum Challenge: String, Codable, CaseIterable {
    case all = "All challenges"
    case short = "7 days"
    case med = "14 days"
    case long = "28 days"
    case single = "Single"
}

extension Level {
    enum ErrorType: Error {
        case encoding
        case decoding
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        let decodedValue = try value.decode(String.self)
        
        switch decodedValue {
        case "Beginner":
            self = .beginner
        case "Intermediate":
            self = .intermediate
        case "Advanced":
            self = .advanced
        
        default:
            print("Error occurs while decoding 'Level' key.")
            throw ErrorType.decoding
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .beginner:
            try container.encode("Beginner")
        case .intermediate:
            try container.encode("Intermediate")
        case .advanced:
            try container.encode("Advanced")
        case .all:
            try container.encode("None")

        }
    }
}

extension Exercise {
    enum ErrorType: Error {
        case encoding
        case decoding
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        let decodedValue = try value.decode(String.self)
        
        switch decodedValue {
        case "Cardio":
            self = .cardio
        case "Flexibility":
            self = .flexibility
        case "Strength Training":
            self = .strength
        case "Balance":
            self = .balance
        
        default:
            print("Error occurs while decoding 'Exercise' key.")
            throw ErrorType.decoding
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .cardio:
            try container.encode("Cardio")
        case .flexibility:
            try container.encode("Flexibility")
        case .strength:
            try container.encode("Strength Training")
        case .balance:
            try container.encode("Balance")
        case .all:
            try container.encode("None")

        }
    }
}

extension Challenge {
    enum ErrorType: Error {
        case encoding
        case decoding
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        let decodedValue = try value.decode(String.self)
        
        switch decodedValue {
        case "7 days":
            self = .short
        case "14 days":
            self = .med
        case "28 days":
            self = .long
        case "Single":
            self = .single
        
        default:
            print("Error occurs while decoding 'Level' key.")
            throw ErrorType.decoding
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .short:
            try container.encode("7 days")
        case .med:
            try container.encode("14 days")
        case .long:
            try container.encode("28 days")
        case .single:
            try container.encode("Single")
        case .all:
            try container.encode("None")

        }
    }
}
