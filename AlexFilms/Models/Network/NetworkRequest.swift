

//
//  NetworkRequest.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

class NetworkRequest {
    
//        var cellData: CompletionData?
    
    private let queue = DispatchQueue(label: "TabBarControllerMain_working_queue", qos: .userInitiated)
    
    static var shared = NetworkRequest()
    
    //    var startDate : Date = Date()
    //    let dateFormatter = DateFormatter(coder: "yyyy")
    //    dateFormatter.dateFormat = "yyyy"
    
    private init() {}
    
    func fetchMovieData(inputText: String,
                        completion: ((CompletionData) -> Void)?) {
        //completion: (([Result]) -> Void)?) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10")
        else { return }
        
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let filmData = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    DispatchQueue.main.async {
                        let completionData = CompletionData(
                            
//                            for result in filmData.results {
//                                print(result.trackName)
//                                print(result.releaseDate)
//                                print(result.longDescription)
//                                print(result.primaryGenreName)
//                                print(result.artworkUrl30)
                            
                            trackName: filmData.result.trackName,
                            releaseDate: filmData.result.releaseDate
                            primaryGenreName: <#T##String#>,
                            longDescription: <#T##String#>,
                            artworkUrl30: <#T##String#>: filmData.result.trackName,
                            )
                        completion?(completionData)
                    }
//                }
//            }
            
//            {data, _, error in
//                if let error = error { print(error); return }
//                do {
//                    let response = try JSONDecoder().decode(AppleResponseModel.self, from: data!)
//                    for result in response.results {
//                        print(result.trackName)
//                        print(result.releaseDate)
//                        print(result.longDescription)
//                        print(result.primaryGenreName)
//                        print(result.artworkUrl30)
//                    }
//                }
//                catch {
//                    print(error)
//                }
//            }
            task.resume()
        }
        
    }
}
            
//            { data, response, error in
//                if let data = data, let films = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
//                    DispatchQueue.main.async {
                        
                        
                        
                        
                        
//                        let completionData = CompletionData(
//                            for result in films.film
                            
                            
                            
                            
//                            films: [Film], trackName: films.result.trackName,
//                            artworkUrl30: films.result.artworkUrl30
//                            releaseDate: films.result.releaseDate
//                            primaryGenreName: films.result.primaryGenreName
//                            longDescription: films.result.longDescription
//                        )
//                        completion?(films.CompletionData)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//}
        
        
        







/*
 
 
 //
//  NetworkRequest.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

class NetworkRequest {
    
    //    var cellData: CompletionData?
    
    private let queue = DispatchQueue(label: "TabBarControllerMain_working_queue", qos: .userInitiated)
    
    static var shared = NetworkRequest()
    
//    var startDate : Date = Date()
//    let dateFormatter = DateFormatter(coder: "yyyy")
//    dateFormatter.dateFormat = "yyyy"
    
    private init() {}
    
    func fetchMovieData(inputText: String,
                        completion: ((CompletionData) -> Void)?) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10")
        else { return }
        
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let film = try? JSONDecoder().decode(AppleResponseModel.self, from: data)
                {
                    DispatchQueue.main.async {
                           
//                        let dateFormatter = DateFormatter()
//                        dateFormatter.dateFormat = "yyyy"
//
//                        let yearStr = String(from: dateFormatter.date(from: film.results.first?.releaseDate ?? "") as! Decoder)
//                        var releaseDate = yearStr

                        
                        let completionData = CompletionData(
                            trackName: film.results.first?.trackName ?? "",
//                            release/Date: releaseDate,  //film.results.first?.releaseDate,
                            primaryGenreName: film.results.first?.primaryGenreName ?? "",
                            longDescription: film.results.first?.longDescription ?? "",
                            artworkUrl30: film.results.first?.artworkUrl30 ?? "")
                        
                         
                    }
                }
            }
            task.resume()
        }
    }
}
        
        
        
        
        
        //     https://itunes.apple.com/search?term="rocky"&entity=movie&limit=10
        
        


*/


