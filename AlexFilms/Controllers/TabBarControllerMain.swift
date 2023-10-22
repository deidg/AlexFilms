//
//  TabBarController_Main.swift
//  AlexFilms
//
//  Created by Alex on 20.10.2023.
//
// TODO: setup searchTextField constraint to searchIcon
// настройка запроса тут https://youtu.be/VGjH6gUcDJc?si=-SaYEwhjDHyzLo0i

import UIKit

class TabBarControllerMain: UIViewController {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.backgroundColor = .white
        
//        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

}

//extension TabBarControllerMain: UITableViewDelegate {
//
//    func filmsTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("hello from cell")
//    }
//}

extension TabBarControllerMain: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = "poherr"
        return cell
    }
}
