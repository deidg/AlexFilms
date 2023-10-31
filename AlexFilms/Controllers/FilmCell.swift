
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
    
    func configure(with data: Result) {
        filmNameLabel.text = data.trackName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        yearOfTheFilmLabel.text = dateFormatter.string(from: data.releaseDate)
        genreOfTheFilmLabel.text = data.primaryGenreName
        
        
    }
}
    







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

