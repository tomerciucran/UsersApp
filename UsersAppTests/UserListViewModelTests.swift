//
//  UserListViewModelTests.swift
//  UsersAppTests
//
//  Created by Tomer Ciucran on 09.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

@testable import UsersApp
import XCTest
import RxSwift

class UserListViewModelTests: XCTestCase {
    
    var mockClient: MockClient!
    var viewModel: UserListViewModel!

    override func setUp() {
        super.setUp()

        mockClient = MockClient()
        viewModel = UserListViewModel(client: mockClient)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUserCount() {
        let count = viewModel.users.value.count
        XCTAssertEqual(count, 2)
    }

}
