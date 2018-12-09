//
//  UserTests.swift
//  UsersAppTests
//
//  Created by Tomer Ciucran on 09.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

@testable import UsersApp
import XCTest

class UserTests: XCTestCase {
    
    let sampleJSON: [String: Any] = [
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": [
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": [
                "lat": "-37.3159",
                "lng": "81.1496"
            ]
        ],
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": [
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
        ]
    ]

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInitFromJSON() {
        do {
            let data = try JSONSerialization.data(withJSONObject: sampleJSON, options: .prettyPrinted)
            let user = try JSONDecoder().decode(User.self, from: data)
            
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "Leanne Graham")
            XCTAssertEqual(user.username, "Bret")
            XCTAssertEqual(user.email, "Sincere@april.biz")
            XCTAssertEqual(user.address.street, "Kulas Light")
            XCTAssertEqual(user.address.suite, "Apt. 556")
            XCTAssertEqual(user.address.city, "Gwenborough")
            XCTAssertEqual(user.address.zipcode, "92998-3874")
        } catch {
            return XCTFail()
        }
    }
}
