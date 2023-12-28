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
    
    func makeFavourite(trackName: String, releaseDate: String, primaryGenreName: String, shortDescription: String?, longDescription: String?, artworkUrl100: String, trackId: Int) {
        
        let chosenMovie = FavouriteMovie(trackName: trackName, releaseDate: releaseDate, primaryGenreName: primaryGenreName, shortDescription: shortDescription, longDescription: longDescription, artworkUrl100: artworkUrl100, trackId: trackId)
        favouriteMovieArray.insert(chosenMovie, at: 0)
        print("Im printing from str 38Favoutri \(favouriteMovieArray)")
    }
    
    func makeUnFavourite(trackName: String) {
        
        favouriteMovieArray = favouriteMovieArray.filter{$0.trackName != trackName}

        
        userDefaults.removeObject(forKey: "favouriteMovie")
        print(userDefaults)
        
        
        
    }

}



