//
//  RegistrationFormVC.swift
//  AlexFilms
//
//  Created by Alex on 04.10.2023.
//

import UIKit
import SnapKit

class RegistrationFormVC: UIViewController {
    
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = UIFont(name: "Ubuntu", size: 32)
        return label
    }()
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        //        imageView.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let selectPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select photo", for: .normal)  // сделать дефолтный голубой шрифт
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .cyan
        button.isEnabled = true
        
        return button
    }()
    //
    //    private let userImagePicker: UIImagePickerController
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First name"
        
        //        label.font =
        
        
        return label
    }()
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        
        
        textField.placeholder = "Enter first name"
        //        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last name"
        return label
    }()
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter last name"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    private let birthDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of birth"   // ?? -  разве age? а не дата рождения?
        return label
    }()
    
    // DATE of birthday
    
    
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
        
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        addTargets()
        
        self.view.backgroundColor = .white
        
    }
    
    private func setupUI() {
        
        view.addSubview(headLabel)
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(view).inset(80)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(photoImage)
        photoImage.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(150)
            make.height.equalTo(100)
            
        }
        
        view.addSubview(photoImage)
        photoImage.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(150)
            make.height.equalTo(100)
            
        }
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(photoImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview().inset(50)
            
        }
        //                view.addSubview(userImagePicker)
        //                userImagePicker.snp.makeConstraints { <#ConstraintMaker#> in
        //                    <#code#>
        //                }
        
        view.addSubview(firstNameLabel)
        firstNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(headLabel).inset(200)
        }
        
        view.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(firstNameLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
            
        }
        
        view.addSubview(secondNameLabel)
        secondNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(firstNameTextField.snp.bottom).offset(10)
        }
        
        view.addSubview(lastNameTextField)
        lastNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(secondNameLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.addSubview(birthDateLabel)
        birthDateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(lastNameTextField.snp.bottom).offset(10)
        }
        
        // AGE Textfield?
        
        
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(lastNameTextField.snp.bottom).offset(60) // привязать к AGE Textfield.bottom
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(10) // привязать к AGE Textfield.bottom
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            //            make.height.equalTo(40)
            //            make.leading.equalToSuperview().inset(20)
            //            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            //            make.horizontalEdges.equalToSuperview().inset(20)
            
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
            
        }
        
    }
    
    func addTargets() {
        selectPhotoButton.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
        
    }
    
    
    
    @objc func selectPhotoButtonTapped() {
        
        print("selectPhotoButton Tapped")
        showImagePickerController()
    }
    
    
}

extension RegistrationFormVC: UIImagePickerControllerDelegate {
    @objc func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
}


extension RegistrationFormVC: UINavigationControllerDelegate {
    
}
