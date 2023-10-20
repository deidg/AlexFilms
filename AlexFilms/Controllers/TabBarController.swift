//
//  TabBarController.swift
//  AlexFilms
//
//  Created by Alex on 04.10.2023.
//

import UIKit

class TabBarController: UITabBarController {

    
//    let tabBarControllerMainVC = TabBarControllerMain()
//    let tabBarControllerFavouritesVC = TabBarControllerFavourites()
//    let tabBarControllerProfileVC = TabBarControllerProfile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor = .red
//        self.title = "MainVC"
        
        generateTabs()
    }

    //MARK: Tab setup
    private func generateTabs() {
        viewControllers = [
        generateVC(viewController: TabBarControllerMain(), title: "Main", image: UIImage(systemName: "house.fill")),
        generateVC(viewController: TabBarControllerFavourites(), title: "Favourites",image: UIImage(systemName: "star.fill")),
        generateVC(viewController: TabBarControllerProfile(), title: "Profile", image: UIImage(systemName: "person.crop.circle"))
        ]
    }

    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
}
