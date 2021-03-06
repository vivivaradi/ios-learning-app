//
//  CurrentDataCell.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 07..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class CurrentDataCell: UITableViewCell {

    // MARK: - IBOutlet variables
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cellLogoImage: UIImageView!
    @IBOutlet weak var myDataLabel: UILabel!
    @IBOutlet weak var remainingDataLabel: UILabel!
    @IBOutlet weak var totalDataLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var remainingDaysLabel: UILabel!
    
    // MARK: - Setup cell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(from package: CurrentDataCellItemViewModel) {
        self.myDataLabel.text = package.name
        let totalDataString = DataConverter.addMeasurement(to: package.totalData)
        self.totalDataLabel.text = "left of \(totalDataString) bundle"
        let remainingData = package.totalData - package.usedData
        let remainingDataString = DataConverter.addMeasurement(to: remainingData)
        self.remainingDataLabel.text = remainingDataString
        self.progressView.progress = (Float(package.usedData) / Float(package.totalData))
        self.remainingDaysLabel.text = "Resets in \(package.daysLeft) days"
        self.cellLogoImage.image = UIImage(named: "MyDataCardLogoPlaceholder")
        self.setupStyle()
    }

    func setupStyle() {
        self.myDataLabel.font = UIFont(name: Constants.roboto, size: 20)
        self.remainingDataLabel.font = UIFont(name: Constants.roboto, size: 36)
        self.totalDataLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.remainingDaysLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.remainingDaysLabel.textColor = Color.lightGrey
        
        self.progressView.trackTintColor = Color.progressTintGrey
        self.progressView.progressTintColor = Color.vodafoneRed
        self.progressView.clipsToBounds = true
        self.progressView.layer.cornerRadius = 8
        self.progressView.layer.sublayers?.forEach({ layer in
            layer.cornerRadius = 8
        })
        self.progressView.subviews.forEach { view in
            view.clipsToBounds = true
        }
        
        self.containerView.layer.masksToBounds = false
        self.containerView.layer.shadowColor = Color.shadowColor.cgColor
        self.containerView.layer.shadowOpacity = 1
        self.containerView.layer.shadowRadius = 6
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.containerView.layer.cornerRadius = 5
        
        self.selectionStyle = .none
        
        self.layoutIfNeeded()
    }
}
