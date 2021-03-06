import SwiftUI

struct Workout: Codable, Hashable {
    let ytURL: String
    let type: Level
    let name: String
    let instructor: String
    let time: Double
    var tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case ytURL, name, instructor, time, tags
        case type = "level"
    }
}

enum Level: String, Codable, CaseIterable {
    case all = "All"
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
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
