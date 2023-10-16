//
//  RegistrationFormVC.swift
//  AlexFilms
//
//  Created by Alex on 04.10.2023.
//

import UIKit

class RegistrationFormVC: UIViewController {
    
    
    private let headLabel: UILabel = {
        let label = UILabel()
        
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
        
        return label
    }()
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        
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
        
        self.view.backgroundColor = .blue
        
    }
    
    
    
}
