//
//  DataCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 06..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class RefillDataCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupStyle() {
           // Initialization code
           priceLabel.font = UIFont(name: "Roboto-Regular", size: 12)
           priceLabel.textColor = UIColor(red: 102/256, green: 102/256, blue: 102/256, alpha: 1)
           dataLabel.font = UIFont(name: "Roboto-Regular", size: 16)
           dataLabel.textColor = UIColor(red: 51/256, green: 51/256, blue: 51/256, alpha: 1)
           logoImage.image = UIImage(named: "ListLogoPlaceholder")
       }
    
}
