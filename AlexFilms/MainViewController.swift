//
//  MainViewController.swift
//  AlexFilms
//
//  Created by Alex on 02.10.2023.
//

import Foundation
import SnapKit

final class MainViewController: UIViewController {
    
    private let mainLabelAuthPage: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter email"
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter password"
        return textfield
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        
        
    }
    
    private func setupUI() {
        view.addSubview(mainLabelAuthPage)
        mainLabelAuthPage.snp.makeConstraints { make in
            make.top.equalTo(view).inset(250)
            make.center.equalToSuperview()
        }
        
    }
    
    
    
    
}
