
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
import CoreData



class TabBarControllerMain: UIViewController {
    
        var items = [Movie]()
    
    let favouriteMovie = MoviesEntity()
    var isFavorite: Bool = false

    
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
    
    let imageHeart = UIImage(systemName: "heart")
    let imageHeartFill = UIImage(systemName: "heart.fill")
    
    
    var favouriteButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setImage(imageHeart, for: .normal)
        button.isEnabled = true
        button.tintColor = .red
        return button
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
        
        favouriteButton.setImage(imageHeart, for: .normal)

        
        
        
        
        addTargets()
    }
    
    private func setupUI() {
        view.addSubview(filmsTableView)
        filmsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
//        view.addSubview(favouriteButton)
//        favouriteButton.snp.makeConstraints { make in
////            make.right.equalTo(filmImage.snp.left).inset(-5)
//            
//            make.leading.equalTo(filmsTableView.snp.left).inset(100)
//
//            make.bottom.equalToSuperview().inset(5)
//        }
        
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


