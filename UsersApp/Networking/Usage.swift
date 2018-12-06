// The MIT License (MIT)
//
// Copyright (c) 2017 Alexander Grebenyuk (github.com/kean).

import Foundation


// MARK: Defining Endpoints

enum API {}

extension API {
    static func getCustomer() -> Endpoint<Customer> {
        return Endpoint(path: "customer/profile")
    }

    static func patchCustomer(name: String) -> Endpoint<Customer> {
        return Endpoint(
            method: .patch,
            path: "customer/profile",
            parameters: ["name" : name]
        )
    }
}

final class Customer: Decodable {
    let name: String
}


// MARK: Using Endpoints

func test() {
    let client = Client()
    _ = client.request(API.getCustomer())
    _ = client.request(API.patchCustomer(name: "Alex"))
}
