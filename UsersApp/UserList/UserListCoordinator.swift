//
//  UserListCoordinator.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 06.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import UIKit

class UserListNavigator: Navigator {
    
    let navigationController: UINavigationController?
    
    enum Destination {
        case userPostList(userId: Int)
    }
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func navigate(to destination: UserListNavigator.Destination) {
        switch destination {
        case .userPostList(let userId):
            if let userPostsTableVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "UserPostsTableViewController") as? UserPostsTableViewController {
                userPostsTableVC.configure(userId: userId)
                navigationController?.show(userPostsTableVC, sender: nil)
            }
        }
    }
}
