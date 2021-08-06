//
//  SectionHeaderCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 09..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class SectionHeaderCell: UITableViewCell {

    // MARK: - IBOutlet variables
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Setup cell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupStyle() {
        self.titleLabel.font = UIFont(name: Constants.roboto, size: 20)
        self.backgroundColor = .white
        self.layoutIfNeeded()
    }
    
    func setupData(with title: String) {
        self.titleLabel.text = title
        self.setupStyle()
    }
}
