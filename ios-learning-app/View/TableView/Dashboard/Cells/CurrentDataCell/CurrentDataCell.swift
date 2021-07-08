//
//  CurrentDataCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 07..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class CurrentDataCell: UITableViewCell {

    @IBOutlet weak var headerLogoImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var cellLogoImage: UIImageView!
    @IBOutlet weak var myDataLabel: UILabel!
    @IBOutlet weak var remainingDataLabel: UILabel!
    @IBOutlet weak var totalDataLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var remainingDaysLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(currentPackage: CurrentDataPackage) {
        self.myDataLabel.text = currentPackage.name
        self.totalDataLabel.text = "left of \(currentPackage.totalData) bundle"
        self.remainingDataLabel.text = "\(currentPackage.totalData - currentPackage.usedData)"
        self.progressView.progress = Float(currentPackage.usedData / currentPackage.totalData)
    }
    
    //MARK: UI setup
    func setupStyle() {
        self.headerLogoImage.image = UIImage(named: "ListLogoPlaceholder")
        self.welcomeLabel.text = "Welcome lorem ipsum!"
        self.cellLogoImage.image = UIImage(named: "MyDataCardLogoPlaceholder")
        self.progressView.trackTintColor = UIColor(named: "ProgressBarGrey")
        self.progressView.progressTintColor = UIColor(named: "VodafoneRed")
        
    }
    
}
