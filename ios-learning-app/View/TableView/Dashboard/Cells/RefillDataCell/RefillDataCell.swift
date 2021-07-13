//
//  DataCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 06..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class RefillDataCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(from package: RefillDataPackage) {
        self.priceLabel.text = "\(package.price) Ft"
        self.dataLabel.text = package.name
        self.setupStyle()
    }
    
    //MARK: UI setup
    private func setupStyle() {
           priceLabel.font = UIFont(name: Constants.roboto, size: 12)
           priceLabel.textColor = UIColor(red: 102/256, green: 102/256, blue: 102/256, alpha: 1)
           dataLabel.font = UIFont(name: Constants.roboto, size: 16)
           dataLabel.textColor = UIColor(red: 51/256, green: 51/256, blue: 51/256, alpha: 1)
           logoImage.image = UIImage(named: "ListLogoPlaceholder")
        self.containerView.layer.cornerRadius = 5

        self.containerView.layer.borderWidth = 0.5

        self.containerView.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        //self.layoutIfNeeded()
       }
    
}
