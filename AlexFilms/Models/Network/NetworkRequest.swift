

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
                        completion: (([Result]) -> Void)?) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10")
        else { return }
        
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let films = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    DispatchQueue.main.async {
                        completion?(films.results)
                    }
                }
            }
            task.resume()
        }
    }
}
        
        
        







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


