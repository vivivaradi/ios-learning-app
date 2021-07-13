//
//  SectionHeaderCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 09..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class SectionHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupStyle() {
        self.titleLabel.font = UIFont(name: "Roboto-Regular", size: 20)
        self.backgroundColor = .white
        self.layoutIfNeeded()
    }
    
    func configure(with title: String) {
        self.titleLabel.text = title
        self.setupStyle()
    }
}
