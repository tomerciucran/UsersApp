//
//  UserPostTableViewCell.swift
//  UsersApp
//
//  Created by Tomer Ciucran on 07.12.18.
//  Copyright © 2018 Tomer Ciucran. All rights reserved.
//

import UIKit

class UserPostTableViewCell: UITableViewCell {

    static let cellIdentifier = "UserPostTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(viewModel: UserPostViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.body
    }

}
