
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

class TabBarControllerMain: UIViewController, UISearchResultsUpdating {
    
    
    var items = [CompletionData]()
//    var filmCell = FilmCell()
    
    let filmPageVC = FilmPageVC()
    
    var searchController = UISearchController(searchResultsController: nil)
    
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
    
//    func updateSearchResults(for searchController: UISearchController) {
//           // Filter the results here based on the search text
//           if let searchText = searchController.searchBar.text {
//               fetchData(searchTerm: searchText)
//           }
//       }
    
    func fetchData(searchTerm: String) {
            NetworkRequest.shared.fetchMovieData(inputText: searchTerm) { [weak self] results in
                guard let self = self, let results = results else { return }
                self.items = results
                DispatchQueue.main.async {
                    self.filmsTableView.reloadData()
                }
            }
        }
    
//    func fetchData(searchTerm: String) {
//        NetworkRequest.shared.fetchMovieData(inputText: searchTerm) { [weak self] results in
//            guard let self = self, let results = results else { return }
//            self.items = results
//            print("str124")
//            //                print(self.items)
////            self.updateCell(CompletionData)
//
//            DispatchQueue.main.async {
//                self.filmsTableView.reloadData()
//            }
//        }
//    }
    
//    func updateCell(_ data: CompletionData) {
//        let cellData = FilmCellData(trackName: data.trackName, primaryGenreName: data.primaryGenreName, longDescription: data.longDescription, artworkUrl30: data.artworkUrl30)
//    }
   
    
    @objc(updateSearchResultsForSearchController:) public func updateSearchResults(for searchController: UISearchController) {
             if let searchText = searchController.searchBar.text {
                 fetchData(searchTerm: searchText)
             }
         }
    
}

extension TabBarControllerMain: UITableViewDelegate {
    
}

extension TabBarControllerMain: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 //items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "filmCell") as? FilmCell else {
            return UITableViewCell()
        }
//        let data = items[indexPath.row]
//        cell.configure(with: data)
        return cell
    }
    
}

extension TabBarController: UITextFieldDelegate {
    
}



extension TabBarControllerMain: UISearchBarDelegate {
    
}


