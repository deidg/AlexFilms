//
//  FilmCellData.swift
//  AlexFilms
//
//  Created by Alex on 26.10.2023.
//

import Foundation

struct FilmCellData {
    let trackName: String
    let releaseDate: Date //??? в стринг надо переделать
    let primaryGenreName: PrimaryGenreName
    let longDescription: String
    let artworkUrl30: String
}
