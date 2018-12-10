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
    
    var viewModel: UserListViewModel?
    private let client = Client()
    private var navigator: UserListNavigator?
    private let disposeBag = DisposeBag()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        if viewModel == nil { viewModel = UserListViewModel(client: client) }
        navigator = UserListNavigator(navigationController: navigationController)
        bindViewModel()
    }
    
    // MARK: - Configurations
    
    private func bindViewModel() {
        viewModel?.users.asObservable().bind(to: tableView.rx.items) { tableView, row, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier) as? UserTableViewCell
            cell?.configure(viewModel: element)
            return cell ?? UITableViewCell()
        }.disposed(by: disposeBag)
        tableView.rx.itemSelected.subscribe { [unowned self] indexPath in
            guard let row = indexPath.element?.row,
                let element = self.viewModel?.users.value[row] else {
                    return
            }
            self.navigator?.navigate(to: .userPostList(userId: element.id))
        }.disposed(by: disposeBag)
    }
}
