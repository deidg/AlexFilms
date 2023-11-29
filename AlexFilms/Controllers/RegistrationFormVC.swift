//
//  RegistrationFormVC.swift
//  AlexFilms
//
//  Created by Alex on 04.10.2023.
//



//закончил на том что научился забирать введеный имейли и выводить в поле кода.
//начать думать как его хранить и где. 




//TODO: сделать валидацию на имейл
//TODO: ?? убирать placeholder для birthDateTextField ??
//TODO: ?? там же запретить вводить текст?
//TODO: ?? сделать валидацию на пароль (6 знаков)???

import UIKit
import SnapKit
import Firebase
import FirebaseAuth

class RegistrationFormVC: UIViewController {
    
//    private let storage: StorageManagerProtocol = StorageManager()
    
    
    //MARK: elements
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = UIFont(name: "Ubuntu", size: 32)
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
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First name"
        return label
    }()
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter first name"
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
        label.text = "Date of birth"
        return label
    }()
    private  let birthDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.sizeToFit()
        return picker
    }()
    private let birthDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Choose date of birth"
        textField.borderStyle = .roundedRect
        return textField
    }()
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
        datePickerSetup()
        
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        birthDateTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        
//        passwordTextField.text = storage.fetchEmail(forKey: .email ) ?? "herr а не имейл"
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
        view.addSubview(birthDateTextField)
        birthDateTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(birthDateLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(birthDateTextField.snp.bottom).offset(10)
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
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
    }
    
    func datePickerSetup() {
        //datePicker setup
        birthDateTextField.inputView = birthDatePicker
        birthDatePicker.datePickerMode = .date
        birthDatePicker.preferredDatePickerStyle = .wheels
        birthDateTextField.inputView = birthDatePicker
        //toolbar for datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneActionForDatePicker))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)    //перенос doneButton на правую часть экрана    doneButtonSetup
        toolbar.setItems([flexSpace,doneButton], animated: true)
        birthDateTextField.inputAccessoryView = toolbar    //добавляет toolbar  c кнопкой к пикеру
    }
    
    func addTargets() {
        selectPhotoButton.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)  // срабатывает кнопка Sign UP
    }
    
    func getDateFromDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM YYYY"
        birthDateTextField.text = formatter.string(from: birthDatePicker.date)
    }
    
    @objc func doneActionForDatePicker() {
        getDateFromDatePicker()
        view.endEditing(true)
    }
    
    @objc func createUser() {
        
        
                guard let firstName = firstNameTextField.text else { return }
                guard let lastName = lastNameTextField.text else { return }
                guard let dateOfBirth = birthDateTextField.text else { return }
                guard let email = emailTextField.text else { return }
                guard let password = passwordTextField.text else { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                if let result = result {
                    let uid = result.user.uid
                    let ref = Database.database().reference(withPath: "users/\(uid)")
                    let values = ["firstName": firstName, "lastName": lastName, "dateOfBirth": dateOfBirth, "email": email]
                    ref.setValue(values) { (error, _) in
                        if error == nil {
                            print("User saved to database")
                        } else {
                            print("Error saving user to database: \(error?.localizedDescription ?? "")")
                        }
                    }
                }
            } else {
                print("Error creating user: \(error?.localizedDescription ?? "")")
            }
        }

    }

//    @objc func signUpButtonTapped() {
//
//        guard let firstName = firstNameTextField.text else { return }
//        guard let lastName = lastNameTextField.text else { return }
//        guard let dateOfBirth = birthDateTextField.text else { return }
//        guard let email = emailTextField.text else { return }
//        guard let password = passwordTextField.text else { return }
//
//        print(firstName)
//        print(lastName)
//        print(dateOfBirth)
//        print(email)
//        print(password)
//
//        print("RegFormVC 326")
//
////        guard let (email, password) = validatedInputs() else { return }
//
//
////        if(!firstName.isEmpty && !lastName.isEmpty && !dateOfBirth.isEmpty && !email.isEmpty && !password.isEmpty) {
//
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                if error == nil {
//                    if let result = authResult{
//                        print(result.user.uid)
//                        print("RegFormVC340")
//                    }
//                }
//            }
//        }
//    else {
//            showAlert()
//            print("RegFormVC 339")
//        }
//
//    }
    
    
//    func signUpUser(_ textField: UITextField) -> Bool {
                
//        let firstName = firstNameTextField.text!
//        let lastName = lastNameTextField.text!
//        let dateOfBirth = birthDateTextField.text!
//        let email = emailTextField.text!
//        let password = passwordTextField.text!
//
//        print("RegFormVC 326")
//
//        if(!firstName.isEmpty && !lastName.isEmpty && !dateOfBirth.isEmpty && !email.isEmpty && !password.isEmpty) {
//            Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
//                if error == nil {
//                    if let result = result{
//                        print(result.user.uid)
//                        print("RegFormVC340")
//                    }
//                }
//            }
//        } else {
//            showAlert()
//            print("RegFormVC 339")
//        }
//        return true
//    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
    //MARK: delegates
extension RegistrationFormVC: UIImagePickerControllerDelegate {
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

extension RegistrationFormVC: UINavigationControllerDelegate {
    
}

extension RegistrationFormVC: UITextFieldDelegate {
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        let firstName = firstNameTextField.text!
//        let lastName = lastNameTextField.text!
//        let dateOfBirth = birthDateTextField.text!
//        let email = emailTextField.text!
//        let password = passwordTextField.text!
//
//        print("RegFormVC 326")
//
//        if(!firstName.isEmpty && !lastName.isEmpty && !dateOfBirth.isEmpty && !email.isEmpty && !password.isEmpty) {
//            Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
//                if error == nil {
//                    if let result = result{
//                        print(result.user.uid)
//                        print("RegFormVC340")
//                    }
//                }
//            }
//        } else {
//            showAlert()
//            print("RegFormVC 339")
//        }
//        return true
//    }
}

