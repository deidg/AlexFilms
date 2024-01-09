//
//  User.swift
//  AlexFilms
//
//  Created by Alex on 09.01.2024.
//

import Foundation

struct User: Codable {
    let name: String
    let surname: String
    let email: String
    let age: Int
    let avatar: URL?
    
    var favouriteFilmsArray: [FavouriteMovie]?
}
