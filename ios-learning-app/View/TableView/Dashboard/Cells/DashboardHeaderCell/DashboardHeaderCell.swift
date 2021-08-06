//
//  DashboardHeaderCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 14..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class DashboardHeaderCell: UITableViewCell {

    //MARK: - IBOutlet variables
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var headerLogoImage: UIImageView!
    
    // MARK: - Setup cell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupStyle() {
        self.welcomeLabel.textAlignment = NSTextAlignment.right
        self.welcomeLabel.font = UIFont(name: Constants.roboto, size: 18)
        self.welcomeLabel.textColor = Color.darkGrey
        self.layoutIfNeeded()
    }
    
    func setupData() {
        self.headerLogoImage.image = UIImage(named: "HeaderLogoPlaceholder")
        self.welcomeLabel.text = "Welcome lorem ipsum!"
        
        setupStyle()
    }
    
}
