//
//  UserTableViewCell.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 05.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "UserTableViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    func configure(viewModel: UserViewModel) {
        nameLabel.text = "Name: \(viewModel.name)"
        usernameLabel.text = "Username: \(viewModel.username)"
        emailLabel.text = "Email: \(viewModel.email)"
        addressLabel.text = "Address: \(viewModel.address)"
    }
}
