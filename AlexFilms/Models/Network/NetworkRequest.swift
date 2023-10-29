//
//  NetworkRequest.swift
//  AlexFilms
//
//  Created by Alex on 24.10.2023.
//

import Foundation

class NetworkRequest {
    
    var cellData: CompletionData?
    
    private let queue = DispatchQueue(label: "NetworkRequest_working_queue", qos: .userInitiated)
    static let shared = NetworkRequest()
    
        private init() {}
//    init() {}
    
//    private func fetchData(searchTerm: String) {
//        guard let searchTerm = searchTextField.text else { return }
//        NetworkRequest.shared.fetchMovieData(inputText: searchTerm) { [weak self] appleResponse in
//            print("Data fetched")
//            if let results = appleResponse?.results, let firstResult = results.first {
//                let cellData = CompletionData(
//                    trackName: firstResult.trackName,
//                    releaseDate: firstResult.releaseDate,
//                    primaryGenreName: firstResult.primaryGenreName,
//                    longDescription: firstResult.longDescription,
//                    artworkUrl30: firstResult.artworkUrl30
//                )
//                // Update the UI on the main queue
//                DispatchQueue.main.async {
//                    self?.filmCellData = cellData
//                    self?.filmsTableView.reloadData()
//                }
//            }
//        }
//    }


    
        
    func fetchMovieData(inputText: String,
                        completion: @escaping(FilmCellData?) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10")
        else {
            completion(nil)
            return
        }
        
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    completion(nil)
                    return
                }
                //
                
                if let data = data, let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    
                    let results = appleResponse.results
                    //
                    if let firstResult = results.first {
                        
                        self.cellData = CompletionData(
                            trackName: firstResult.trackName,
                            releaseDate: firstResult.releaseDate,
                            primaryGenreName: firstResult.primaryGenreName,
                            longDescription: firstResult.longDescription,
                            artworkUrl30: firstResult.artworkUrl30
                        )
                        
                        
                        print("herr35")
                        //                    print(appleResponse.fetchMovieData(inputText: <#T##String#>, completion: <#T##(AppleResponseModel?) -> Void#>))
                        
                        
                        //                guard let data = data, let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data) else {
                        //                    print("Failed to decode response data")
                        //                    completion(nil)
                        //                    return
                        //                }
                        
                        completion?(FilmCellData)
                    }
                    //                task.resume()
                }
//                task.resume()
                
            }
            task.resume()

        }
    }
         
         
         
         
}
    /*
    func fetchMovieData(inputText: String,
                           completion: ((CompletionData) -> Void)?) {     // Welcome - структура модель??? ответа сервера (отдельный файл)
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(inputText)&entity=movie&limit=10"
        ) else { completion(nil)
            return
        } //{ return }
        queue.async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let appleResponse = try? JSONDecoder().decode(AppleResponseModel.self, from: data) {
                    
                    print("herr26")
                    print(appleResponse)

                    
                    
//                    DispatchQueue.main.async {
//                        for result in appleResponse.results {
//                            let completionData = CompletionData(
//                                trackName: result.trackName,
//                                releaseDate: result.releaseDate,
//                                primaryGenreName: result.primaryGenreName,
//                                longDescription: result.longDescription,
//                                artworkUrl30: result.artworkUrl30
//                                //                            artworkUrl60:
//                                //                            artworkUrl100:
//
//                            )
//                            completion?(completionData)
//                        }
//                    }
                }
            }
            task.resume()
        }
    }
     
     */
//}
    
    
    
    
    
    
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
     
     
     https://itunes.apple.com/search?term="rocky"&entity=movie&limit=10
     
     
     
     */
//}
