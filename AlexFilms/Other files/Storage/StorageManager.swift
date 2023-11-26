//
//  StorageManager.swift
//  
//
//  Created by Alex on 24.11.2023.
//

import Foundation

protocol StorageManagerProtocol {
    func setEmail(_ email: String, forKey key: StorageManager.Keys)
    func fetchEmail(forKey key: StorageManager.Keys) -> String?
}

class StorageManager {
    public enum Keys: String {
        case email
    }
    private let userDefaults = UserDefaults.standard
    internal func emailStore(userEmail: String, key: String) {
        userDefaults.set(userEmail, forKey: key)
    }
    internal func emailRestore(forKey key: String) -> Any? { // ?? Any?
        userDefaults.object(forKey: key)
    }
}

extension StorageManager: StorageManagerProtocol {
    func setEmail(_ email: String, forKey key: Keys) {
        emailStore(userEmail: email, key: key.rawValue)
    }
    func fetchEmail(forKey key: Keys) -> String? {
        emailRestore(forKey: key.rawValue) as? String
    }
}
