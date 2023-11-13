

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
    
    func fetchMovieData(inputText: String, completion: @escaping (CompletionData?) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10") else {
//            completion(nil) // Replace YourErrorType with the appropriate error type
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("some error 29")
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    completion(nil) // Replace YourErrorType with the appropriate error type
                    return
                }
                
                do {
                    let appleResponse = try JSONDecoder().decode(AppleResponseModel.self, from: data)
                    
//                    self.items = appleResponse
                    
                    // Map AppleResponseModel to CompletionData
                    let completionData = CompletionData(
                        trackName: appleResponse.results.first?.trackName ?? "",
                        releaseDate: appleResponse.results.first?.releaseDate ?? Date(),
                        primaryGenreName: appleResponse.results.first?.primaryGenreName ?? "",
                        longDescription: appleResponse.results.first?.longDescription ?? "",
                        artworkUrl30: appleResponse.results.first?.artworkUrl30 ?? ""
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
    
    
    /*
    
    func fetchMovieData(inputText: String, completion: @escaping (CompletionData?, Error?) -> Void) { //([CompletionData]?) -> Void) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10") else {
//            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("some error 29")
                    completion(nil, error)
                    return
                }
                guard let data = data  else { return }
                do {
                    let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data)
                    completion(appleResponse, nil)
                } catch let jsonError {
                    print("failed to decode JSON", jsonError)
                    completion(nil, jsonError)
                }
                
                
            }
        }
    }
    
    
    */
    
    
//                    let completionData = appleResponse.results.map { result in
//                        return CompletionData(
//                            trackName: result.trackName,
//                            releaseDate: result.releaseDate,
//                            primaryGenreName: result.primaryGenreName,
//                            longDescription: result.longDescription,
//                            artworkUrl30: result.artworkUrl30
//                        )
//                    }
//                    DispatchQueue.main.async {
//                        completion(completionData)
//                    }
//                } else {
//                    completion(nil)
//                }
//            }
//            task.resume()
//        }
//    }
//}





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

