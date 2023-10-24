//
//  NetworkRequest.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

class NetworkRequest {
    private let queue = DispatchQueue(label: "NetworkRequest_working_queue", qos: .userInitiated)
    static let shared = NetworkRequest()
    
    private init() {}
    
    func fetchMovieData(inputText: String,
                           completion: ((CompletionData) -> Void)?) {     // Welcome - структура модель??? ответа сервера (отдельный файл)
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10"
) else { return }
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    DispatchQueue.main.async {
                        for result in appleResponse.results {
                            let completionData = CompletionData(
                                trackName: result.trackName,
                                releaseDate: result.releaseDate,
                                primaryGenreName: result.primaryGenreName,
                                longDescription: result.longDescription,
                                artworkUrl30: result.artworkUrl30
                                //                            artworkUrl60:
                                //                            artworkUrl100:
                                
                            )
                            completion?(completionData)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
    
    
    
    
    
    
    /*
    static let shared = NetworkRequest()
    
    private init() {}
    
//    func requestData(urlString: String, completion: @escaping (Result<Data, Error>) -> Void ) {
    func requestData(urlString: String, completion: @escaping (Result) -> Void ) {

        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
//                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
                return data
            }
        }
        .resume()
    }
     
     */
//}
