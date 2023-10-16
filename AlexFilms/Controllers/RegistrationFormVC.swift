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
    
//    private let photoImage: UIImage = {
//        let image = UIImage()
//
//        return image
//    }()
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
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    private let nameTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        self.view.backgroundColor = .white
        
    }
    
    private func setupUI() {
        
        view.addSubview(headLabel)
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(view).inset(100)
            make.centerX.equalToSuperview()
        }
        
        //        view.addSubview(photoImage)
        //        photoImage.snp.makeConstraints { <#ConstraintMaker#> in
        //            <#code#>
        //        }
        //        view.addSubview(userImagePicker)
        //        userImagePicker.snp.makeConstraints { <#ConstraintMaker#> in
        //            <#code#>
        //        }
        
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
        
    }
    
    
    
}
