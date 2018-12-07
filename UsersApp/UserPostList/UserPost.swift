//
//  UserPost.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 07.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import Foundation

class UserPost: Decodable {
    private(set) var userId: Int = 0
    private(set) var id: Int = 0
    private(set) var title: String = ""
    private(set) var body: String = ""
}
