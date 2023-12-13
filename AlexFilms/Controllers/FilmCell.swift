
//
//  FilmCell.swift
//  AlexFilms
//
//  Created by Alex on 23.10.2023.
// TODO: make stack of labels (name, year, genre)

import UIKit
import SnapKit
import Kingfisher
import CoreData

class FilmCell: UITableViewCell {
    
    
    var favouriteButtonItem: UIBarButtonItem?
    var isFavorite: Bool = false
    
    var filmNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var yearOfTheFilmLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    var genreOfTheFilmLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var filmImage: UIImageView = {
        let imageView = UIImageView()
        imageView.sizeToFit()
        return imageView
    }()
    
    
    //=====
    let imageHeart = UIImage(systemName: "heart")
    let imageHeartFill = UIImage(systemName: "heart.fill")
    
    var favouriteButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setImage(imageHeart, for: .normal)
        button.isEnabled = true
        button.tintColor = .red
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
       addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK - Setup
    func setupView() {
        setupCellUI()
    }
    
    func setupCellUI() {
        
//        favouriteButton.setImage(imageHeart, for: .normal)
        
        contentView.addSubview(filmImage)
        filmImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            //            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)  //(50)
            //            make.height.equalTo(30)
        }
        
        contentView.addSubview(filmNameLabel)
        filmNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(self.frame.width / 2)
        }
        
        contentView.addSubview(yearOfTheFilmLabel)
        yearOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(filmNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        contentView.addSubview(genreOfTheFilmLabel)
        genreOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(yearOfTheFilmLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            //            make.bottom.equalToSuperview()
            make.width.equalTo(self.frame.width / 2)
        }
          
        contentView.addSubview(favouriteButton)
        favouriteButton.snp.makeConstraints { make in
            make.right.equalTo(filmImage.snp.left).inset(-5)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
    //TODO: - проверить код. кажется надо присваивание текстов вынексти из loadImage!!!!
    func cellConfigure(with data: Movie) {   //конструирует макет ячейки
        self.yearOfTheFilmLabel.text = String(data.releaseDate.prefix(4))
        self.genreOfTheFilmLabel.text = data.primaryGenreName
        
        loadImage(from: data.artworkUrl100) { [weak self] image in
            self?.filmImage.image = image
            self?.filmNameLabel.text = data.trackName
        }
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
    
    func addTargets() {
        favouriteButton.addTarget(self, action: #selector(makeFavourite), for: .touchUpInside)
    }

    @objc func makeFavourite(sender: UIButton) {
    //(chosenMovie: FavouriteMovie ) {   // красит или выкрашивает сердечко в избранное toggleFavorite()

        if isFavorite == false {

            print("movie add to favourites")
//            CoreDataManager.shared.makeMovieFavourite(chosenMovie: chosenMovie)
//            makeMovieFavourite(chosenMovie: <#T##FavouriteMovie#>)
            favouriteButton.setImage(imageHeartFill, for: .normal)
            isFavorite = true

        } else {
            print("movie excepted from favourites")
            favouriteButton.setImage(imageHeart, for: .normal)
            isFavorite = false

        }
    }
    
 
}



