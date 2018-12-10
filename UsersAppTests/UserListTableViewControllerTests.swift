//
//  UserListTableViewControllerTests.swift
//  UsersAppTests
//
//  Created by Tomer Ciucran on 10.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

@testable import UsersApp
import XCTest
import RxSwift

class UserListTableViewControllerTests: XCTestCase {
    
    var mockClient: MockClient!
    var userListTableVC: UserListTableViewController!

    override func setUp() {
        super.setUp()
        mockClient = MockClient()
        guard let navController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let userListTableVC = navController.viewControllers.first as? UserListTableViewController else {
            return XCTFail()
        }
        self.userListTableVC = userListTableVC
        self.userListTableVC.viewModel = UserListViewModel(client: mockClient)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testUserListCount() {
        guard let userCount = userListTableVC.viewModel?.users.value.count else {
            return XCTFail()
        }
        let tableUserCount = userListTableVC.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(userCount, tableUserCount)
    }
}
