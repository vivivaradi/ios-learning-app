//
//  DataPackageResultViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 04..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit

class DataPackageResultViewController: UIViewController {
    
    var viewModel: DataPackageResultViewModelType!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var myVodafoneLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dataPackageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultDescription: UILabel!
    @IBOutlet weak var dashboardButton: UIButton!
    
    override func viewDidLoad() {
        self.setupStyle()
    }
    
    func setupStyle() {
        self.backgroundView.backgroundColor = Color.vodafoneRed
        
        self.logoImageView.image = UIImage(named: "HeaderLogoPlaceholder")
        
        self.myVodafoneLabel.text = "My Vodafone"
        self.myVodafoneLabel.textColor = Color.white
        self.myVodafoneLabel.font = UIFont(name: Constants.roboto, size: 24)
        
        self.containerView.layer.cornerRadius = 10
        self.containerView.backgroundColor = Color.white
        
        self.dataPackageLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.dataPackageLabel.textColor = Color.lightGrey
        self.dataPackageLabel.textAlignment = .center
        
        self.resultLabel.textColor = Color.darkGrey
        self.resultLabel.font = UIFont(name: Constants.roboto, size: 24)
        self.resultLabel.textAlignment = .center
        self.resultLabel.lineBreakMode = .byWordWrapping
        self.resultLabel.numberOfLines = 0
        
        self.resultDescription.textAlignment = .center
        self.resultDescription.textColor = Color.darkGrey
        self.resultDescription.font = UIFont(name: Constants.roboto, size: 16)
        self.resultDescription.lineBreakMode = .byWordWrapping
        self.resultDescription.numberOfLines = 0
        
        self.dashboardButton.setTitle("Go to Dashboard", for: .normal)
        self.dashboardButton.setTitleColor(Color.white, for: .normal)
        self.dashboardButton.isEnabled = true
    }
    
    func setupData() {
        
    }
    
}
