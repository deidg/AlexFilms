
//
//  TabBarController_Main.swift
//  AlexFilms
//
//  Created by Alex on 20.10.2023.
//
// TODO: setup searchTextField constraint to searchIcon
// настройка запроса тут https://youtu.be/VGjH6gUcDJc?si=-SaYEwhjDHyzLo0i


//TODO: обновлять запрос побуквенно через search bar - https://www.youtube.com/live/7H287JaSERk?si=_T0y5YIMJ9Ut3yAk&t=1900

// TODO: searchTerm = searchTextField.text else { return }  //!!! поменять название переменно



import UIKit

//let filmPageVC = FilmPageVC()

class TabBarControllerMain: UIViewController, UITextFieldDelegate {
    var items = [CompletionData]()
    
    let filmPageVC = FilmPageVC()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Movies"
        label.font = UIFont(name: "Ubuntu", size: 24)
        return label
    }()
    
    private let searchView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let searchIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "magnifyingglass")
        return view
    }()
    
    private let searchTextField: UITextField = {  //сделать короткую запись
        let textfield = UITextField()
        return textfield
    }()
    
    private let filmsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        return tableView
    }()
    
//    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchController.
        setupUI()
        navigationItem.searchController = self.searchController
        view.backgroundColor = .white
 
//        filmsTableView.delegate = self
        filmsTableView.dataSource = self
//        filmsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        filmsTableView.register(FilmCell.self, forCellReuseIdentifier: "filmCell")
        self.filmsTableView.rowHeight = 100
        
        searchTextField.delegate = self
        
        
        fetchData(searchTerm: "man")
    }
    
    private func setupUI() {
    
        view.addSubview(headLabel)
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(view).inset(60)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        view.addSubview(searchIcon)
        searchIcon.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.top).inset(5)
            make.leading.equalTo(searchView.snp.leading).inset(10)
        }
        
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.top).inset(5)
            make.left.right.equalTo(searchView).inset(30)
//            make.leading.equalTo(searchIcon.snp.right).inset(5)
//            make.trailing.equalTo(searchView.snp.trailing).inset(10)
            make.height.equalTo(20)
        }
        
        view.addSubview(filmsTableView)
        filmsTableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func fetchData(searchTerm: String) {
            NetworkRequest.shared.fetchMovieData(inputText: searchTerm) { [weak self] results in
                guard let self = self, let results = results else { return }
                self.items = results
                print("str124")
//                print(self.items)
                DispatchQueue.main.async {
                    self.filmsTableView.reloadData()
                }
            }
        }
    }

//    func updateFilmCell(data: CompletionData) {
//        let cell = FilmCellData(trackName: data.trackName,
//                                primaryGenreName: data.primaryGenreName,
//                                longDescription: data.longDescription,
//                                artworkUrl30: data.artworkUrl30)
//    }





extension TabBarControllerMain: UITableViewDelegate {

//    func filmsTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        print("hello from cell")
//    }
}

extension TabBarControllerMain: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard var cell = tableView.dequeueReusableCell(withIdentifier: "filmCell") as? FilmCell else {
                return UITableViewCell()
            }
        
        
        
        
//        cell.genreOfTheFilmLabel.text = "comedy"
        
        
//            let data = items[indexPath.row]
//            cell.configure(with: data)

            return cell
        }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell") as? FilmCell else { return UITableViewCell() }
//        cell.configure(with: items[indexPath.row])
//
//                NetworkRequest.shared.fetchMovieData(inputText: "Legend") { [weak self] results in
//                    guard let self else { return }
//        //            self.items = results
//                }
//
//
//
//        return cell
//    }

}

extension TabBarController: UITextFieldDelegate {
    
}


