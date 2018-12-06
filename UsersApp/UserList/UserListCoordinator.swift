//
//  UserListCoordinator.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 06.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import UIKit

class UserListCoordinator: Coordinator {
    
    let navigationController: UINavigationController?
    
    enum Destination {
        case userPostList(userId: Int)
    }
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func navigate(to destination: UserListCoordinator.Destination) {
        
    }
}
