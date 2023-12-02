//
//  MainViewController.swift
//  AlexFilms
//
//  Created by Alex on 02.10.2023.
//

//TODO: change font of mainLabelAuthPage into custom font


import Foundation
import SnapKit
import Firebase

final class MainViewController: UIViewController {
    
    let customTabBarController = TabBarController()
    
    let registrationFormViewController = RegistrationFormVC()
    
    let filmPageViewController = FilmPageVC()
        
    private let mainLabelAuthPage: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont(name: "Ubuntu", size: 32)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textfield = UITextField()
        //        textfield.frame = CGRect(x: 0, y: 0, width: 200, height: 35)
        textfield.borderStyle = .roundedRect
        textfield.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textfield.placeholder = "Enter email"
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter password"
        textfield.borderStyle = .roundedRect
        textfield.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 5
//        textfield.isSecureTextEntry = true 
        return textfield
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 10
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.isEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        addTargets()
    }
    
    private func setupUI() {
        view.addSubview(mainLabelAuthPage)
        mainLabelAuthPage.snp.makeConstraints { make in
            make.top.equalTo(view).inset(250)
            make.centerX.equalToSuperview()
        }
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabelAuthPage.snp.bottom).offset(25)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(100)
        }
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(100)
        }
    }
    
    func addTargets() {
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(openRegistrationFormVC), for: .touchUpInside)
    }
    
    @objc func signInButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Please enter email and password")
            return
        }
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        Auth.auth().signIn(with: credential) { request, error in
            if let error = error {
                print("Error signing in: \(error)")
                return
            }
            
            self.customTabBarController.modalPresentationStyle = .fullScreen
            self.present(self.customTabBarController, animated: true, completion: nil)
        }
    }
    
    
    @objc func openRegistrationFormVC() {
        registrationFormViewController.modalPresentationStyle = .fullScreen
        present(registrationFormViewController, animated: true, completion: nil)
        
        print("136 MainVC")
    }
}




