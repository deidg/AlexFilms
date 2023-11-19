
//
//  CompletionData.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation


// то на что надо разложить полученный результат
struct CompletionData {
//    let films: [Film]
////    let artworkUrl60: String
////    let artworkUrl100: String
//}

//struct Film {
    let trackName: String
    let releaseDate: String//Date
    let primaryGenreName: String
    let shortDescription: String?
    let artworkUrl100: String
    
    let trackId: Int
}

//enum CodingKeys: String, CodingKey {
//    case trackID = "trackId"
//}

// MARK: - Welcome
//struct Welcome: Codable {
//    let resultCount: Int
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//
//    let kind: Kind   //тип возвращаемого обхекта - фильм  !!!!
//    let trackName: String   // название фильма
//    let artworkUrl30, artworkUrl60, artworkUrl100: String //  кажется ссылка на картинку
//    let releaseDate: Date   //- дата фильма
//    let primaryGenreName: PrimaryGenreName   // жанр!!
//
//enum CodingKeys: String, CodingKey {
//        case kind
//        case trackName
//        case artworkUrl30, artworkUrl60, artworkUrl100
//        case releaseDate, primaryGenreName
//    }
//}
//
//enum Kind: String, Codable {
//    case featureMovie = "feature-movie"
//}
//
//enum PrimaryGenreName: String, Codable {
//    case comedy = "Comedy"
//}







/*
https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo.

 apiRequest
 https://itunes.apple.com/search?term=apiRequest&entity=movie&limit=10
 
 https://itunes.apple.com/search?term=trip&entity=movie&limit=10

 
 
 
 
 
 
 import Foundation

 // MARK: - Welcome
 struct Welcome: Codable {
     let resultCount: Int
     let results: [Result]
 }

 // MARK: - Result
 struct Result: Codable {
 
 let kind: Kind   //тип возвращаемого обхекта - фильм  !!!!
 let trackName: String   // название фильма
 let artworkUrl30, artworkUrl60, artworkUrl100: String //  кажется ссылка на картинку
 let releaseDate: Date   //- дата фильма
 let primaryGenreName: PrimaryGenreName   // жанр!!
 
 enum CodingKeys: String, CodingKey {
         case kind
         case trackName
         case artworkUrl30, artworkUrl60, artworkUrl100
         case releaseDate, primaryGenreName
     }
 }
 
 enum PrimaryGenreName: String, Codable {
     case comedy = "Comedy"
 }
 
 
 
 
 

*/







/*

//
//  CompletionData.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation


// то на что надо разложить полученный результат
struct CompletionData {
    let trackName: String
//    let releaseDate: String
    let primaryGenreName: String
    let longDescription: String
    let artworkUrl30: String
//    let artworkUrl60: String
//    let artworkUrl100: String
}


// MARK: - Welcome
//struct Welcome: Codable {
//    let resultCount: Int
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//
//    let kind: Kind   //тип возвращаемого обхекта - фильм  !!!!
//    let trackName: String   // название фильма
//    let artworkUrl30, artworkUrl60, artworkUrl100: String //  кажется ссылка на картинку
//    let releaseDate: Date   //- дата фильма
//    let primaryGenreName: PrimaryGenreName   // жанр!!
//
//enum CodingKeys: String, CodingKey {
//        case kind
//        case trackName
//        case artworkUrl30, artworkUrl60, artworkUrl100
//        case releaseDate, primaryGenreName
//    }
//}
//
//enum Kind: String, Codable {
//    case featureMovie = "feature-movie"
//}
//
//enum PrimaryGenreName: String, Codable {
//    case comedy = "Comedy"
//}







/*
https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo.

 apiRequest
 https://itunes.apple.com/search?term=apiRequest&entity=movie&limit=10
 
 https://itunes.apple.com/search?term=trip&entity=movie&limit=10

 
 
 
 
 
 
 import Foundation

 // MARK: - Welcome
 struct Welcome: Codable {
     let resultCount: Int
     let results: [Result]
 }

 // MARK: - Result
 struct Result: Codable {
 
 let kind: Kind   //тип возвращаемого обхекта - фильм  !!!!
 let trackName: String   // название фильма
 let artworkUrl30, artworkUrl60, artworkUrl100: String //  кажется ссылка на картинку
 let releaseDate: Date   //- дата фильма
 let primaryGenreName: PrimaryGenreName   // жанр!!
 
 enum CodingKeys: String, CodingKey {
         case kind
         case trackName
         case artworkUrl30, artworkUrl60, artworkUrl100
         case releaseDate, primaryGenreName
     }
 }
 
 enum PrimaryGenreName: String, Codable {
     case comedy = "Comedy"
 }
 
 
 
 
 

*/
*/

