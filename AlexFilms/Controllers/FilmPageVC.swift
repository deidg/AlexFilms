//
//  FilmPageVC.swift
//  AlexFilms
//
//  Created by Alex on 22.10.2023.
//
//TODFO: make closeButton to dismiss VC

import UIKit

class FilmPageVC: UIViewController {
    
    var trackID: Int?
    
    
    private let filmNameLabel: UILabel = {
        let label = UILabel()
//        label.text = "filmName"
        label.backgroundColor = .green
        label.font = UIFont(name: "Ubuntu", size: 24)
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
//        label.text = "2018"
        label.backgroundColor = .yellow
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
//        label.text = "Action"
        label.backgroundColor = .cyan
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    private var posterImage: UIImageView = {
        var image = UIImageView()
//        image.backgroundColor = .red
//        image.image = UIImage(systemName: "person.fill")
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 0
        label.backgroundColor = .gray
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        view.backgroundColor = .white
        
        if let trackID = trackID {
//            fetchFilmData(trackID)
            fetchFilmData(inputTrackID: trackID) { response in
                self.filmNameLabel.text = response?.trackName
                self.yearLabel.text = response?.releaseDate
                self.genreLabel.text = response?.primaryGenreName
                
                
            }
        }
        
        
//        fetchApiResponse()
    }
    
    func setupUI() {
        view.addSubview(filmNameLabel)
        filmNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top) //navigationController?.navigationItem.inset(60)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        view.addSubview(yearLabel)
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(filmNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        
        view.addSubview(genreLabel)
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(yearLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        
        view.addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.top.equalTo(filmNameLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(view).inset(view.frame.width / 2)
            make.height.equalTo(view.frame.width / 2)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(view.frame.width)
        }
        
    }
    
//    private func fetchFilmData(trackID: Int) {
        
        func fetchFilmData(inputTrackID: Int, completion: @escaping (CompletionData?) -> Void) {
            guard let url = URL(string: "http://itunes.apple.com/lookup?id=\(inputTrackID)" ) else {
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
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy"

                        let completionData = CompletionData(
                            trackName: appleResponse.results.first?.trackName ?? "",
                            releaseDate: appleResponse.results.first?.releaseDate ?? "",
                            primaryGenreName: appleResponse.results.first?.primaryGenreName ?? "",
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
        
        
        
        
        
        
        
//    }
    
}
