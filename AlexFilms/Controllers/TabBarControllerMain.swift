
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

class TabBarControllerMain: UIViewController {
    
    var items = [CompletionData]()

    let filmPageVC = FilmPageVC()
//    let filmCell: FilmCell
    
    var searchController = UISearchController(searchResultsController: nil)
    var appleResponseData: AppleResponseModel? = nil
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private let filmsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
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
        //        searchController.searchBar.showsScopeBar = true
        
        navigationItem.searchController = searchController
        self.title = "Home" //Navigation Title
        self.definesPresentationContext = true
        
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupUI() {
        
        view.addSubview(filmsTableView)
        filmsTableView.snp.makeConstraints { make in
            //            make.top.equalTo(searchView.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    
    func fetchData(searchTerm: String) {
        NetworkRequest.shared.fetchMovieData(inputText: searchTerm) { [weak self] completionData in
            guard let self = self, let completionData = completionData else { return }

            self.items.append(completionData) // completionData

            DispatchQueue.main.async {
                self.filmsTableView.reloadData()
            }
        }
    }
    
    
}

extension TabBarControllerMain: UITableViewDelegate {
    
}

extension TabBarControllerMain: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? FilmCell else {
            return UITableViewCell()
        }
        let data = items[indexPath.row]
        cell.cellConfigure(with: data)
        cell.getYear(from: data.releaseDate)
        
        let film = appleResponseData?.results[indexPath.row]
        cell.filmNameLabel.text = film?.trackName
        
        
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
        //                    print(text)
        NetworkRequest.shared.fetchMovieData(inputText: text) { [weak self] appleResponse in
//            let appleResponse = completionData
//            let film = items[indexPath.row]
//            compl
            
            self?.fetchData(searchTerm: text)

            
            print("here 123 TableBarVC")
            print(appleResponse)
            
            
        
            
        }
    }
}


