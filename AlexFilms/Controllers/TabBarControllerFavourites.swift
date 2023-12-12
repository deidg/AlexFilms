//
//  TabBarController_Favourites.swift
//  AlexFilms
//
//  Created by Alex on 20.10.2023.
//

import UIKit

class TabBarControllerFavourites: UIViewController {
    
    var items = [FavouriteMovie]()
    
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Favourites"
        label.font = UIFont(name: "Ubuntu", size: 24)
        return label
    }()
    
    private let filmsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .cyan
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.backgroundColor = .white
        
        //        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.register(FilmCell.self, forCellReuseIdentifier: "filmCell")
        self.filmsTableView.rowHeight = 100
    }
    
    private func setupUI() {
        
        view.addSubview(headLabel)
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(view).inset(60)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(filmsTableView)
        filmsTableView.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}



//extension TabBarControllerFavourites: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
////        return 1
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? FilmCell else {
//            return UITableViewCell()
//        }
//
//        let data = items[indexPath.row]
//        cell.cellConfigure(with: data)
//
//        let film = appleResponseData?.results[indexPath.row]
//        cell.filmNameLabel.text = film?.trackName
//        return cell
//    }
//}


//extension TabBarControllerFavourites: UITableViewDelegate {
//
//    func filmsTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("hello from cell")
//    }
//}

extension TabBarControllerFavourites: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell") else { return UITableViewCell() }
//        cell.textLabel?.text = "favorite film"
        return cell
    }
}

