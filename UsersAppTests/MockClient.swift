//
//  MockClient.swift
//  UsersAppTests
//
//  Created by Tomer Ciucran on 09.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

@testable import UsersApp
import Foundation
import RxSwift

class MockClient: ClientProtocol {
    
    let users: [User] = [
        User(id: 1,
             name: "name",
             username: "username",
             email: "email",
             address: User.Address(street: "street",
                                   suite: "suite",
                                   city: "city",
                                   zipcode: "zipcode")),
        User(id: 2,
             name: "name",
             username: "username",
             email: "email",
             address: User.Address(street: "street",
                                   suite: "suite",
                                   city: "city",
                                   zipcode: "zipcode"))
    ]
    
    func request<Response>(_ endpoint: Endpoint<Response>) -> Single<Response> {
        guard let users = Single.just(users) as? Single<Response> else {
            return Single.never()
        }
        return users
    }
}
