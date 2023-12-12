
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

//TODO:  добавить появление страницы описания фильма через detailVC -  showDetailViewController(_:sender:)




import UIKit


class TabBarControllerMain: UIViewController {
    
        var items = [Movie]()
    
    let favouriteMovie = MoviesEntity()
    
    //    let filmPageVC = FilmPageVC()
    
    var searchController = UISearchController(searchResultsController: nil)
    var appleResponseData: AppleResponseModel? = nil
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private let filmsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
        
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.register(FilmCell.self, forCellReuseIdentifier: "filmCell")
        self.filmsTableView.rowHeight = 100
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        
        navigationItem.searchController = searchController
        self.title = "Home" //Navigation Title
        self.definesPresentationContext = true
        
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupUI() {
        view.addSubview(filmsTableView)
        filmsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func fetchData(searchTerm: String) {
        NetworkRequest.shared.fetchMovieData(inputText: searchTerm) { [weak self] completionData in
            guard let self = self, let completionData = completionData else { return }
            self.items = completionData
            DispatchQueue.main.async {
                self.filmsTableView.reloadData()
            }
            self.filmsTableView.reloadData()
        }
    }
    
//    @objc favouriteButtonTapped() {
//        FilmCell.
//    }
//    
    
}

extension TabBarControllerMain: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmPageVC = FilmPageVC()
        
        let selectedFilm = items[indexPath.row]
        let trackId = selectedFilm.trackId
      
        filmPageVC.trackId = trackId
        self.show(filmPageVC, sender: self)
    }
}


extension TabBarControllerMain: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
//        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? FilmCell else {
            return UITableViewCell()
        }
        
        let data = items[indexPath.row]
        cell.cellConfigure(with: data)
        
        let film = appleResponseData?.results[indexPath.row]
        cell.filmNameLabel.text = film?.trackName
        
//        cell.makeFavourite(chosenMovie: items[indexPath.row])
        
        
        return cell
    }
}
extension TabBarControllerMain: UITextFieldDelegate {
}
extension TabBarControllerMain: UISearchBarDelegate {
    
}
extension TabBarControllerMain: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        NetworkRequest.shared.fetchMovieData(inputText: text) { [weak self] appleResponse in
            self?.fetchData(searchTerm: text)
        }
    }
}


