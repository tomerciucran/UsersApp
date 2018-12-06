//
//  UsersAPI.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 05.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import Foundation

enum UsersAPI {
    static func getUsers() -> Endpoint<[User]> {
        return Endpoint(path: "users")
    }
}
