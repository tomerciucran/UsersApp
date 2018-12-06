//
//  User.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 05.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import Foundation

class User: Decodable {
    private(set) var id: Int = 0
    private(set) var name: String = ""
    private(set) var username: String = ""
    private(set) var email: String = ""
    private(set) var address = Address()
    
    class Address: Decodable {
        private(set) var street: String = ""
        private(set) var suite: String = ""
        private(set) var city: String = ""
        private(set) var zipcode: String = ""
    }
}
