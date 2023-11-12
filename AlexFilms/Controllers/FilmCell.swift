
//
//  FilmCell.swift
//  AlexFilms
//
//  Created by Alex on 23.10.2023.
// TODO: make stack of labels (name, year, genre)

import UIKit
import SnapKit
import Kingfisher

class FilmCell: UITableViewCell {
    
    let filmNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let yearOfTheFilmLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        return label
    }()
    
    var genreOfTheFilmLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    let filmImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        
        return imageView
    }()
    
    let unlikedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = .red
        return image
    }()
    
    let likedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = .red
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        self.frame.height = 100
        setupView()
        likedImage.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK - Setup
    func setupView() {
        
        setupCellUI()
        self.backgroundColor = .cyan
    }
    
    
    
    func setupCellUI() {
        
        addSubview(filmImage)
        filmImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            //            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)  //(50)
            //            make.height.equalTo(30)
        }
        
        addSubview(filmNameLabel)
        filmNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            //            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)
        }
        
        addSubview(yearOfTheFilmLabel)
        yearOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(filmNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(10)
            //            make.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        
        addSubview(genreOfTheFilmLabel)
        genreOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(yearOfTheFilmLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(10)
            //            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)
        }
        
        //        addSubview(unlikedImage)
        //        unlikedImage.snp.makeConstraints { make in
        //            make.right.equalTo(filmImage.snp.left).inset(-5)
        //            make.bottom.equalToSuperview().inset(5)
        //        }
        
        addSubview(likedImage)
        likedImage.snp.makeConstraints { make in
            make.right.equalTo(filmImage.snp.left).inset(-5)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
    
    func configure(with data: CompletionData) {
        filmNameLabel.text = data.trackName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        yearOfTheFilmLabel.text = dateFormatter.string(from: data.releaseDate)
        
        //        genreOfTheFilmLabel.text = data.primaryGenreName.rawValue // Assuming PrimaryGenreName is an enum
        
        // Assuming you have a function to load images asynchronously
        loadImage(from: data.artworkUrl30) { [weak self] image in
            self?.filmImage.image = image
        }
    }
    
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
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
}
    
    
    
//    func configure(with data: CompletionData) {
//        filmNameLabel.text = data.trackName
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy"
//        yearOfTheFilmLabel.text = dateFormatter.string(from: data.releaseDate)
////            genreOfTheFilmLabel.text = data.primaryGenreName
//    }
    
//    func configure(with data: CompletionData) {
//        filmNameLabel.text = data.trackName
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy"
//        yearOfTheFilmLabel.text = dateFormatter.string(from: data.releaseDate)
//        genreOfTheFilmLabel.text = data.primaryGenreName
//
//        if let imageURL = URL(string: data.artworkUrl30) {
//                filmImage.kf.setImage(with: imageURL)
//            }
//    }
//}
    







/*

//
//  FilmCell.swift
//  AlexFilms
//
//  Created by Alex on 23.10.2023.
// TODO: make stack of labels (name, year, genre)

import UIKit
import SnapKit

class FilmCell: UITableViewCell {
    
    let filmNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let yearOfTheFilmLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        return label
    }()
    
    let genreOfTheFilmLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    let filmImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        
        return imageView
    }()
    
    let unlikedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = .red
        return image
    }()
    
    let likedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = .red
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.frame.height = 100
        setupView()
        likedImage.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK - Setup
    func setupView() {
        
        setupCellUI()
        self.backgroundColor = .cyan
    }
    
    
    
    func setupCellUI() {
        
        addSubview(filmImage)
        filmImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)  //(50)
//            make.height.equalTo(30)
        }
        
        addSubview(filmNameLabel)
        filmNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(20)
//            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)
        }
     
        addSubview(yearOfTheFilmLabel)
        yearOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(filmNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(10)
//            make.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        
        addSubview(genreOfTheFilmLabel)
        genreOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(yearOfTheFilmLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(10)
//            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)
        }
        
//        addSubview(unlikedImage)
//        unlikedImage.snp.makeConstraints { make in
//            make.right.equalTo(filmImage.snp.left).inset(-5)
//            make.bottom.equalToSuperview().inset(5)
//        }
        
        addSubview(likedImage)
        likedImage.snp.makeConstraints { make in
            make.right.equalTo(filmImage.snp.left).inset(-5)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
//    func configure(with data: CompletionData) {
//        filmNameLabel.text = data.trackName
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy"
//        yearOfTheFilmLabel.text = dateFormatter.string(from: data.releaseDate)
////            genreOfTheFilmLabel.text = data.primaryGenreName
//    }
    
    func configure(with data: CompletionData) {
        filmNameLabel.text = data.trackName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
//        yearOfTheFilmLabel.text = dateFormatter.string(from: data.releaseDate)
        
//        genreOfTheFilmLabel.text = data.primaryGenreName.rawValue
        
        
        
    }
}
    
 
 */

