//
//  AppleResponseModel.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

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
    let artworkUrl30: String //, artworkUrl60, artworkUrl100: String //  кажется ссылка на картинку
    let releaseDate: Date   //- дата фильма
    let primaryGenreName: PrimaryGenreName   // жанр!!
    let longDescription: String

    
enum CodingKeys: String, CodingKey {
//        case kind
        case trackName
        case artworkUrl30 //, artworkUrl60, artworkUrl100
        case releaseDate, primaryGenreName, longDescription
    }
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
}

enum PrimaryGenreName: String, Codable {
    case comedy = "Comedy"
}
