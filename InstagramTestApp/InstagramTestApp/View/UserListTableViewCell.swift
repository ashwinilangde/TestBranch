//
//  UserListTableViewCell.swift
//  InstagramTestApp
//
//  Created by Sagar Gawande on 16/03/20.
//  Copyright © 2020 Ashwini. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusLabel.layer.masksToBounds = true
        statusLabel.layer.cornerRadius = 6
        statusLabel.layer.borderWidth = 2
        statusLabel.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
