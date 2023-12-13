//
//  CoreDataManager.swift
//  AlexFilms
//
//  Created by Alex on 08.12.2023.
//

import Foundation
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavouritesMoviesList")
        container.loadPersistentStores { storeDescription, error in//{ (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        return container
    }()
    
    func makeMovieFavourite(chosenMovie: FavouriteMovie ) -> Bool { //MoviesEntity? {  // делает фильм избранным
        let context = persistentContainer.viewContext

        let movie = NSEntityDescription.insertNewObject(forEntityName: "MoviesEntity", into: context) as! MoviesEntity

        movie.trackName = chosenMovie.trackName
        movie.releaseDate = chosenMovie.releaseDate
        movie.primaryGenreName = chosenMovie.primaryGenreName
        movie.shortDescript = chosenMovie.shortDescription
        movie.longDescript = chosenMovie.longDescription
        movie.artworkUrl100 = chosenMovie.artworkUrl100

        movie.trackId = String(chosenMovie.trackId)

        do {
            try context.save()
            print("film saved into Favourites!")
            return true //MoviesEntity
        } catch let error {
            print("Failed to create: \(error)")
        }

        return true //MoviesEntity //nil
    }
    
    func fetchFavouritesMovies() {
        
    }
}
