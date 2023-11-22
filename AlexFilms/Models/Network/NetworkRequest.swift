

//
//  NetworkRequest.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

class NetworkRequest {
    
    //    let tabBarControillerMain = TabBarControllerMain()
    
    private let queue = DispatchQueue(label: "TabBarControllerMain_working_queue", qos: .userInitiated)
    
    static var shared = NetworkRequest()
    
    private init() {}
    
    func fetchMovieData(inputText: String, completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10") else {
            return
        }
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        print("some error 29")
                        completion(nil)
                        return
                    }
                    guard let data = data else {
                        completion(nil)
                        return
                    }
                    do {
                        let appleResponse = try JSONDecoder().decode(AppleResponseModel.self, from: data)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy"
                        
                        var movies = [Movie]()
                        //
                        for movie in appleResponse.results {
                            movies.append(Movie(trackName: movie.trackName,
                                                releaseDate: movie.releaseDate,
                                                primaryGenreName: movie.primaryGenreName,
                                                shortDescription: movie.shortDescription,
                                                longDescription: movie.longDescription,
                                                
                                                artworkUrl100: movie.artworkUrl100, trackId: movie.trackId))
                        }
                        
                        completion(movies)
                    } catch let jsonError {
                        print("failed to decode JSON", jsonError)
                        completion(nil)
                    }
                }
            }.resume()
            
        }
    }
        
        func fetchMovieDescription(inputTrackId: Int, completion: @escaping (Movie?) -> Void) {
            guard let url = URL(string: "http://itunes.apple.com/lookup?id=\(inputTrackId)" ) else {
                return
            }
            
            //        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        print("some error 29")
                        completion(nil)
                        return
                    }
                    guard let data = data else {
                        completion(nil)
                        return
                    }
                    do {
                        let appleResponse = try JSONDecoder().decode(AppleResponseModel.self, from: data)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy"
                        
                        let completionData = Movie(
                            trackName: appleResponse.results.first?.trackName ?? "",
                            releaseDate: appleResponse.results.first?.releaseDate ?? "",
                            primaryGenreName: appleResponse.results.first?.primaryGenreName ?? "",
                            shortDescription: appleResponse.results.first?.shortDescription ?? "",
                            longDescription: appleResponse.results.first?.longDescription ?? "",
                            artworkUrl100: appleResponse.results.first?.artworkUrl100 ?? "",
                            trackId: appleResponse.results.first?.trackId ?? 0
                        )
                        completion(completionData)
                    } catch let jsonError {
                        print("failed to decode JSON", jsonError)
                        completion(nil)
                    }
                }
            }.resume()
        }
    }
//}



//     https://itunes.apple.com/search?term="legend"&entity=movie&limit=10

// releaseDate":"2012-12-19T08:00:00Z

//https://itunes.apple.com/search?trackId="1445738215"&entity=movie&limit=1

//http://itunes.apple.com/lookup?id=1445738215

