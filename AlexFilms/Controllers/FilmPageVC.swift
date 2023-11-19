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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    private var posterImage: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    private let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
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
                self.yearLabel.text = String(response?.releaseDate.prefix(4) ?? "")
                self.genreLabel.text = response?.primaryGenreName
                self.shortDescriptionLabel.text = response?.shortDescription
               
                self.loadImage(from: response?.artworkUrl100 ?? "") { [weak self] image in
                    self?.posterImage.image = image
                }
                
            }
        }
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
            make.top.equalTo(yearLabel.snp.bottom).offset(5)
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
        
        view.addSubview(shortDescriptionLabel)
        shortDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.horizontalEdges.equalTo(view).inset(20)
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
                            shortDescription: appleResponse.results.first?.shortDescription ?? "",
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
        
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {    // загружает изображение
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
        
        
        
        
        
//    }
    
}
