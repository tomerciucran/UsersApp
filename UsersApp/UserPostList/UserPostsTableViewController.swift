//
//  UserPostsTableViewController.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 07.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import UIKit
import RxSwift

class UserPostsTableViewController: UITableViewController {
    
    var userId: Int = 0
    private var viewModel: UserPostsViewModel?
    private let client = Client()
    private let disposeBag = DisposeBag()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        viewModel = UserPostsViewModel(userId: userId, client: client)
        bindViewModel()
    }
    
    // MARK: - Configurations
    
    func configure(userId: Int) {
        self.userId = userId
    }
    
    private func bindViewModel() {
        viewModel?.userPosts.asObservable().bind(to: tableView.rx.items) { tableView, row, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: UserPostTableViewCell.cellIdentifier) as? UserPostTableViewCell
            cell?.configure(viewModel: element)
            return cell ?? UITableViewCell()
        }.disposed(by: disposeBag)
    }
}
