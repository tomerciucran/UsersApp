//
//  Coordinator.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 06.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}
