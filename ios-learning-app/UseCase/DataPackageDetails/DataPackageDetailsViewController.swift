//
//  DataPackageDetailsViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit

class DataPackageDetailsViewController: UIViewController {
    
    var viewModel: DataPackageDetailsViewModelType!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var myVodafoneLabel: UILabel!
    @IBOutlet weak var dataPackageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var underTitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var buyButton: ColorChangingButton!
    
    override func viewDidLoad() {
        self.setupStyle()
        self.setupData()
    }
    
    private func setupStyle() {
        self.backgroundView.backgroundColor = Color.vodafoneRed
        self.containerView.backgroundColor = Color.white
        self.containerView.layer.cornerRadius = 10
        self.logoImage.image = UIImage(named: "HeaderLogoPlaceholder")
        self.myVodafoneLabel.text = "My Vodafone"
        self.myVodafoneLabel.textColor = Color.white
        self.myVodafoneLabel.font = UIFont(name: Constants.roboto, size: 24)
        self.dataPackageLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.dataPackageLabel.textColor = Color.lightGrey
        self.dataPackageLabel.textAlignment = .center
        self.titleLabel.textColor = Color.darkGrey
        self.titleLabel.font = UIFont(name: Constants.roboto, size: 24)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.lineBreakMode = .byWordWrapping
        self.underTitleLabel.textColor = Color.darkGrey
        self.underTitleLabel.textAlignment = .center
        self.underTitleLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.contentLabel.font = UIFont(name: Constants.roboto, size: 16)
        self.contentLabel.textColor = Color.darkGrey
        self.contentLabel.textAlignment = .justified
        self.contentLabel.numberOfLines = 0
        self.contentLabel.lineBreakMode = .byWordWrapping
        self.buyButton.titleLabel?.font = UIFont(name: Constants.roboto, size: 20)
        self.buyButton.titleLabel?.textAlignment = .center
        self.buyButton.titleLabel?.textColor = Color.white
    }
    
    func setupData() {
        self.dataPackageLabel.text = "Data Package"
        self.titleLabel.text = "1GB recurring extra data"
        self.underTitleLabel.text = "with 1GB overcharge"
        self.contentLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel imperdiet odio, non sodales est. Vivamus vitae elementum ex. Sed non quam diam. Maecenas tincidunt euismod odio. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vitae libero luctus, blandit dolor nec, posuere est. Curabitur euismod tellus a tortor pellentesque facilisis. Nullam facilisis aliquam est vitae."
        self.buyButton.titleLabel?.text = "Buy"
    }
}
