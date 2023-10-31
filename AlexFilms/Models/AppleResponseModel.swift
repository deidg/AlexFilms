
//  AppleResponseModel.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

    // ответ сервера

// MARK: - Welcome
//struct Welcome: Codable {
struct AppleResponseModel: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
//    let kind: Kind   //жанр фильма?? !!!!
    let trackName: String   // название фильма
    let artworkUrl30: String // ссылка на картинку
    let releaseDate: Date   //- дата фильма
    let primaryGenreName: String // жанр
    let longDescription: String

    
enum CodingKeys: String, CodingKey {
//        case kind
        case trackName
        case artworkUrl30
        case releaseDate, primaryGenreName, longDescription
    }
    
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
}

//enum PrimaryGenreName: String, Codable {
//    case comedy = "Comedy"
//}







//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//           trackName = try container.decode(String.self, forKey: .trackName)
//           artworkUrl30 = try container.decode(String.self, forKey: .artworkUrl30)
//           releaseDate = try container.decode(String.self, forKey: .releaseDate)
//           primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
//           longDescription = try container.decode(String.self, forKey: .longDescription)
//       }





/*


//
//  AppleResponseModel.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

    // ответ сервера

// MARK: - Welcome
//struct Welcome: Codable {
struct AppleResponseModel: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    
//    let kind: Kind   //жанр фильма?? !!!!
    let trackName: String   // название фильма
    let artworkUrl30: String //  кажется ссылка на картинку
//    let releaseDate: Date   //- дата фильма
    let primaryGenreName: String//PrimaryGenreName   // жанр!!
    let longDescription: String

    
enum CodingKeys: String, CodingKey {
//        case kind
        case trackName
        case artworkUrl30
        case releaseDate, primaryGenreName, longDescription
    }
    
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
               trackName = try container.decode(String.self, forKey: .trackName)
               artworkUrl30 = try container.decode(String.self, forKey: .artworkUrl30)
//               releaseDate = try container.decode(String.self, forKey: .releaseDate)
               primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
               longDescription = try container.decode(String.self, forKey: .longDescription)
           }

    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(trackName, forKey: .trackName)
            try container.encode(artworkUrl30, forKey: .artworkUrl30)
//            try container.encode(releaseDate, forKey: .releaseDate)
            try container.encode(primaryGenreName, forKey: .primaryGenreName)
            try container.encode(longDescription, forKey: .longDescription)
        }
    
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
}

//enum PrimaryGenreName: String, Codable {
//    case comedy = "Comedy"
//}







//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//           trackName = try container.decode(String.self, forKey: .trackName)
//           artworkUrl30 = try container.decode(String.self, forKey: .artworkUrl30)
//           releaseDate = try container.decode(String.self, forKey: .releaseDate)
//           primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
//           longDescription = try container.decode(String.self, forKey: .longDescription)
//       }


*/
