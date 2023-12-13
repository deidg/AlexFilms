//
//  FavouritesMovies.swift
//  AlexFilms
//
//  Created by Alex on 08.12.2023.
//

import Foundation

struct FavouriteMovie: Codable {
    let trackName: String
    let releaseDate: String//Date
    let primaryGenreName: String
    let shortDescription: String?
    let longDescription: String?
    let artworkUrl100: String
    
    let trackId: Int
}
