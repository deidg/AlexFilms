//
//  FavouritesMoviesManager.swift
//  AlexFilms
//
//  Created by Alex on 13.12.2023.
//

import Foundation


class FavouritesMoviesManager {
    
    static let shared = FavouritesMoviesManager()
    
    let userDefaults = UserDefaults.standard
    
    var arrayOfFavouritesMovies = [FavouriteMovie]()
    
    private let userKey = SettingKeys.users.rawValue
    private let activeUserKey = SettingKeys.activeUser.rawValue
    
    var users: [User]? {
        get {
            if let data = userDefaults.value(forKey: userKey) as? Data {
                return try? PropertyListDecoder().decode([User].self, from: data)
            } else { return [User]() }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefaults.set(data, forKey: userKey)
            }
        }
    }

    var activeUser: User? {
        get {
            if let data = userDefaults.value(forKey: activeUserKey) as? Data {
                return try? PropertyListDecoder().decode(User.self, from: data)
            } else { return nil }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefaults.set(data, forKey: activeUserKey)
            }
        }
    }
    
    var favouriteMovieArray: [FavouriteMovie] {
        get {
            if let data = userDefaults.value(forKey: "favouriteMovie") as? Data {
                return try! PropertyListDecoder().decode([FavouriteMovie].self, from: data)
            } else {
                return [FavouriteMovie]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefaults.set(data, forKey: "favouriteMovie")
            }
        }
    }
    
    private init() {}
    
    func addFavouriteMovie(movie: FavouriteMovie) {
        if let favourites = activeUser?.favouriteFilmsArray,
           let currentUser = activeUser {
             var updatedFavourites = favourites
            updatedFavourites.append(movie)
            let updatedUser = User(name: currentUser.name, surname: currentUser.surname, email: currentUser.email, age: currentUser.age, avatar: currentUser.avatar, favouriteFilmsArray: updatedFavourites)
            activeUser = updatedUser
        }
    }
    
    func deleteFavouriteMovie(movie: FavouriteMovie) {
        if let favourites = activeUser?.favouriteFilmsArray,
           let currentUser = activeUser {
             var updatedFavourites = favourites
            updatedFavourites.removeAll { $0.trackName == movie.trackName }
            
            let updatedUser = User(name: currentUser.name, surname: currentUser.surname, email: currentUser.email, age: currentUser.age, avatar: currentUser.avatar, favouriteFilmsArray: updatedFavourites)
            activeUser = updatedUser
        }
    }
    
    func isFavouriteMovie(movie: FavouriteMovie) -> Bool {
        guard let activeUser = activeUser,
              let favourites = activeUser.favouriteFilmsArray else { return false }
        if favourites.contains(where: {$0.trackName == movie.trackName}) {
            return true
        }
        
        return false
        
    }
        

    func saveUser(user: User) {
        users?.insert(user, at: 0)
    }
    
    func saveActiveUser(user: User) {
        activeUser = user
    }
    
}

extension FavouritesMoviesManager {
    
    enum SettingKeys: String {
        case users
        case activeUser
    }
    
}



