

//
//  NetworkRequest.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

class NetworkRequest {
    
    private let queue = DispatchQueue(label: "TabBarControllerMain_working_queue", qos: .userInitiated)
    
    static var shared = NetworkRequest()
    
    private init() {}
    
    func fetchMovieData(inputText: String, completion: @escaping ([CompletionData]?) -> Void) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10") else {
            completion(nil)
            return
        }
        
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    let completionData = appleResponse.results.map { result in
                        return CompletionData(
                            trackName: result.trackName,
                            releaseDate: result.releaseDate,
                            primaryGenreName: result.primaryGenreName,
                            longDescription: result.longDescription,
                            artworkUrl30: result.artworkUrl30
                        )
                    }
                    DispatchQueue.main.async {
                        completion(completionData)
                    }
                } else {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
}





/*
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
                if let data = data, let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    let completionData =  appleResponse.results.map { result in
                    trackName: result.results,
                    releaseDate: result.releaseDate,
                    primaryGenreName: result.primaryGenreName,
                    longDescription: result.longDescription,
                    artworkUrl30: result.artworkUrl30
                    }
                    task.resume()
                }
                
            }
        }
    }
}









//     https://itunes.apple.com/search?term="legend"&entity=movie&limit=10





*/

