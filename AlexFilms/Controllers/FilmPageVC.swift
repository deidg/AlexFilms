//
//  FilmPageVC.swift
//  AlexFilms
//
//  Created by Alex on 22.10.2023.
//
//TODFO: make closeButton to dismiss VC

import UIKit

class FilmPageVC: UIViewController {
    
    private let filmNameLabel: UILabel = {
        let label = UILabel()
        label.text = "filmName"
        label.backgroundColor = .green
        label.font = UIFont(name: "Ubuntu", size: 24)
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2018"
        label.backgroundColor = .yellow
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Action"
        label.backgroundColor = .cyan
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    private var posterImage: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .red
//        image.image = UIImage(systemName: "person.fill")
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 0
        label.backgroundColor = .gray
        label.font = UIFont(name: "Ubuntu", size: 18)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        view.backgroundColor = .white
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
}
