
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

class TabBarControllerMain: UIViewController, UITextFieldDelegate, UISearchBarDelegate {
    var items = [CompletionData]()
    
    let filmPageVC = FilmPageVC()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
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
        
        
        setupSearchBar()
//        fetchData(searchTerm: "man")
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        
        
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




extension TabBarControllerMain: UITableViewDelegate {


}

extension TabBarControllerMain: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard var cell = tableView.dequeueReusableCell(withIdentifier: "filmCell") as? FilmCell else {
                return UITableViewCell()
            }

            return cell
        }

}

extension TabBarController: UITextFieldDelegate {
    
}


