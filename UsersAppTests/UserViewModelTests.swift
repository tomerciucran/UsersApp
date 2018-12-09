//
//  UserViewModelTests.swift
//  UsersAppTests
//
//  Created by Tomer Ciucran on 09.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

@testable import UsersApp
import XCTest

class UserViewModelTests: XCTestCase {
    
    let user = User(id: 1,
                    name: "name",
                    username: "username",
                    email: "email",
                    address: User.Address(street: "street",
                                          suite: "suite",
                                          city: "city",
                                          zipcode: "zipcode"))
    
    var userViewModel: UserViewModel!

    override func setUp() {
        super.setUp()
        
        userViewModel = UserViewModel(user: user)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testUserProperties() {
        XCTAssertEqual(userViewModel.id, 1)
        XCTAssertEqual(userViewModel.name, "name")
        XCTAssertEqual(userViewModel.username, "username")
        XCTAssertEqual(userViewModel.email, "email")
        XCTAssertEqual(userViewModel.address, "street suite city zipcode")
    }
}
