

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
//            sleep(2)
            
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
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy"

                    let completionData = CompletionData(
                        trackName: appleResponse.results.first?.trackName ?? "",
//                        releaseDate:  dateFormatter.date(from: appleResponse.results.first?.releaseDate ?? "") ?? Date(),
                        releaseDate: appleResponse.results.first?.releaseDate ?? "",

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

//     https://itunes.apple.com/search?term="legend"&entity=movie&limit=10

// releaseDate":"2012-12-19T08:00:00Z

