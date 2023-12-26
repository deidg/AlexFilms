//
//  TabBarController_Profile.swift
//  AlexFilms
//
//  Created by Alex on 20.10.2023.
//

import UIKit
import FirebaseAuth

class TabBarControllerProfile: UIViewController {
    //MARK: elements
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name: "Ubuntu", size: 22)
        return label
    }()
    let defaultImage = UIImage(systemName: "person.fill")
    var configuration: UIImage.SymbolConfiguration {
        return UIImage.SymbolConfiguration(scale: .small)
    }
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = UIImage(systemName: "person.fill", withConfiguration: configuration)
        return imageView
    }()
    private let selectPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select photo", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        button.setTitleColor(.systemBlue, for: .normal) // сделать  кастомный голубой шрифт
        button.isEnabled = true
        return button
    }()
    //TODO: custom font
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        return label
    }()
    
    private let birthDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of birth"
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        return label
    }()
    
    private let logOutButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTargets()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        photoImage.image = UIImage(systemName: "person.fill", withConfiguration: configuration)
        
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
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(headLabel).inset(200)
        }
        
        view.addSubview(birthDateLabel)
        birthDateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(birthDateLabel.snp.bottom).offset(10)
        }
        
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
    }
    
    func addTargets() {
        selectPhotoButton.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(closeRegistrationFormVC), for: .touchUpInside)
    }
    
    @objc func doneActionForDatePicker() {
        view.endEditing(true)
    }

    @objc func closeRegistrationFormVC() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
//MARK: delegates
extension TabBarControllerProfile: UIImagePickerControllerDelegate {
    @objc func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            photoImage.image = editedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

extension TabBarControllerProfile: UINavigationControllerDelegate {
    
}

