//
//  TabBarController.swift
//  AlexFilms
//
//  Created by Alex on 04.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabs()
    }
    
    //MARK: Tab setup
    
    private func generateTabs() {
        let mainViewController = TabBarControllerMain()
        let favoritesViewController = TabBarControllerFavourites()
        let profileViewController = TabBarControllerProfile()

        let mainNavigationController = UINavigationController(rootViewController: mainViewController)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)

        mainNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "star.fill"), tag: 1)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 2)

        viewControllers = [mainNavigationController, favoritesNavigationController, profileNavigationController]
    }
}

// НИЖЕ тоже рабочий код.
//    private func generateTabs() {
//        viewControllers = [
//        generateVC(viewController: TabBarControllerMain(), title: "Main", image: UIImage(systemName: "house.fill")),
//        generateVC(viewController: TabBarControllerFavourites(), title: "Favourites",image: UIImage(systemName: "star.fill")),
//        generateVC(viewController: TabBarControllerProfile(), title: "Profile", image: UIImage(systemName: "person.crop.circle"))
//        ]
//    }
//
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        return viewController
//    }
//
//}
