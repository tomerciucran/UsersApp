//
//  UserListTableViewController.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 05.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import UIKit
import RxSwift

class UserListTableViewController: UITableViewController {
    
    private var viewModel: UserListViewModel?
    private let client = Client()
    private var coordinator: UserListCoordinator?
    private let disposeBag = DisposeBag()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        viewModel = UserListViewModel(client: client)
        coordinator = UserListCoordinator(navigationController: navigationController)
        bindViewModel()
    }
    
    // MARK: - Configurations
    
    private func bindViewModel() {
        viewModel?.users.asObservable().bind(to: tableView.rx.items) { tableView, row, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier) as? UserTableViewCell
            cell?.configure(viewModel: element)
            return cell ?? UITableViewCell()
        }.disposed(by: disposeBag)
        tableView.rx.itemSelected.subscribe { indexPath in
            print(indexPath)
        }.disposed(by: disposeBag)
    }
}
