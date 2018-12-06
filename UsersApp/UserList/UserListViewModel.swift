//
//  UserListViewModel.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 05.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import Foundation
import RxSwift

class UserListViewModel {
    
    private(set) var users = Variable<[UserViewModel]>([])
    private var disposeBag = DisposeBag()
    private var client: ClientProtocol
    
    init(client: ClientProtocol) {
        self.client = client
        fetchData()
    }
    
    private func fetchData() {
        client.request(UsersAPI.getUsers()).subscribe(onSuccess: { [weak self] userList in
            self?.users.value = userList.map(UserViewModel.init)
        }) { error in
            print(error)
        }.disposed(by: disposeBag)
    }
}

class UserViewModel {
    private(set) var id: Int = 0
    private(set) var name: String = ""
    private(set) var username: String = ""
    private(set) var email: String = ""
    private(set) var address: String = ""
    
    init(user: User) {
        id = user.id
        name = user.name
        username = user.username
        email = user.email
        address = "\(user.address.street) \(user.address.suite) \(user.address.city) \(user.address.zipcode)"
    }
}
