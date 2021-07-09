//
//  CurrentDataCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 07..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class CurrentDataCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
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
    
    func configure(from package: CurrentDataPackage) {
        self.myDataLabel.text = package.name
        let totalDataString = DataConverter.addMeasurement(to: package.totalData)
        self.totalDataLabel.text = "left of \(totalDataString) bundle"
        let remainingData = package.totalData - package.usedData
        let remainingDataString = DataConverter.addMeasurement(to: remainingData)
        self.remainingDataLabel.text = remainingDataString
        self.progressView.progress = (Float(package.usedData) / Float(package.totalData))
    }
    
    //MARK: UI setup
    func setupStyle() {
        self.headerLogoImage.image = UIImage(named: "ListLogoPlaceholder")
        self.welcomeLabel.text = "Welcome lorem ipsum!"
        self.cellLogoImage.image = UIImage(named: "MyDataCardLogoPlaceholder")
        self.progressView.trackTintColor = UIColor(named: "ProgressBarGrey")
        self.progressView.progressTintColor = UIColor(named: "VodafoneRed")
        self.containerView.layer.masksToBounds = false
        self.containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.containerView.layer.shadowOpacity = 1

        self.containerView.layer.shadowRadius = 6

        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.progressView.layer.cornerRadius = 10
    }
    
}
