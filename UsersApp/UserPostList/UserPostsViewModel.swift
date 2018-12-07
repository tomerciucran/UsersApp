//
//  UserPostsViewModel.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 07.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import Foundation
import RxSwift

class UserPostsViewModel {
    
    private(set) var userPosts = Variable<[UserPostViewModel]>([])
    private var disposeBag = DisposeBag()
    let client: ClientProtocol
    let userId: Int
    
    init(userId: Int, client: ClientProtocol) {
        self.client = client
        self.userId = userId
        fetchData()
    }
    
    private func fetchData() {
        client.request(UsersAPI.getUserPosts(userId: userId)).subscribe(onSuccess: { [weak self] userPosts in
            self?.userPosts.value = userPosts.map(UserPostViewModel.init)
        }) { error in
            print(error)
        }.disposed(by: disposeBag)
    }
}

class UserPostViewModel {
    private(set) var title: String = ""
    private(set) var body: String = ""
    
    init(userPost: UserPost) {
        self.title = userPost.title
        self.body = userPost.body
    }
}
