//
//  DashboardHeaderCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 14..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class DashboardHeaderCell: UITableViewCell {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var headerLogoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupStyle() {
        self.headerLogoImage.image = UIImage(named: "HeaderLogoPlaceholder")
        self.welcomeLabel.text = "Welcome lorem ipsum!"
        self.welcomeLabel.textAlignment = NSTextAlignment.right
        self.welcomeLabel.font = UIFont(name: Constants.roboto, size: 18)
        self.layoutIfNeeded()
    }
    
    func configure() {
        setupStyle()
    }
    
}
