
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
    
    var filmNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var yearOfTheFilmLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
//        label.backgroundColor = .orange
        return label
    }()
    
    var genreOfTheFilmLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .blue
        return label
    }()
    
    var filmImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .yellow
        
        return imageView
    }()
    
    var unlikedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = .red
        return image
    }()
    
    var likedImage: UIImageView = {
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
        //        self.backgroundColor = .cyan
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
            make.width.equalTo(self.frame.width / 2)
        }
        
        addSubview(yearOfTheFilmLabel)
        yearOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(filmNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        addSubview(genreOfTheFilmLabel)
        genreOfTheFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(yearOfTheFilmLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
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
    
    //TODO: - проверить код. кажется надо присваивание текстов вынексти из loadImage!!!!
    func cellConfigure(with data: CompletionData) {   //конструирует макет ячейки

        
        self.filmNameLabel.text = data.trackName
        
//        makeBoldFont(textForBold: filmNameLabel.text ?? "")
//           self.yearOfTheFilmLabel.text = getYear(from: data.releaseDate)  //data.releaseDate
        self.genreOfTheFilmLabel.text = data.primaryGenreName
       
        
        
        loadImage(from: data.artworkUrl30) { [weak self] image in
            self?.filmImage.image = image
            
            self?.filmNameLabel.text = data.trackName
//            self?.makeBoldFont(textForBold: self?.filmNameLabel.text ?? "")

        }
    }
    
    func getYear(from dateString: String) -> String {       // форматирует дату, чтобы показывался только ГОД
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Adjust the format based on your API response
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        self.yearOfTheFilmLabel.text = dateString
        return ""
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
    
//    func makeBoldFont(textForBold: String) -> NSAttributedString {
//        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
//        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .body).accessibilityTraits(textForBold) //.withSize(15)
//
//
////        let text = textForBold
//        let boldedText = NSMutableAttributedString(string: textForBold, attributes: boldTextAttributes)
//
//        return boldedText
//    }
}







