//
//  DataCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 06..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class RefillDataCell: UITableViewCell {

    // MARK: - IBOutlet variables
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    // MARK: - Setup cell

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(from package: RefillDataCellItemViewModel) {
        self.priceLabel.text = "\(package.price) Ft"
        self.dataLabel.text = package.name
        self.logoImage.image = UIImage(named: "ListLogoPlaceholder")
        self.setupStyle()
    }

    private func setupStyle() {
        self.priceLabel.font = UIFont(name: Constants.roboto, size: 12)
        self.priceLabel.textColor = Color.mediumGrey
        self.dataLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.dataLabel.textColor = Color.darkGrey
        
        self.containerView.layer.cornerRadius = 5

        self.containerView.layer.borderWidth = 0.5

        self.containerView.layer.borderColor = Color.borderColor.cgColor
        self.layoutIfNeeded()
       }
    
}
