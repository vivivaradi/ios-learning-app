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
  
    @IBOutlet weak var titleStackView: UIStackView!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var myVodafoneLabel: UILabel!
    @IBOutlet weak var dataPackageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var underTitleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var buyButton: ColorChangingButton!
    
    override func viewDidLoad() {
        self.setupStyle()
        self.setupData()
    }
    
    private func setupStyle() {
        self.backgroundView.backgroundColor = Color.vodafoneRed
        
        self.contentStackView.backgroundColor = Color.white
        self.contentStackView.layer.cornerRadius = 10
        self.contentStackView.spacing = 32
        self.contentStackView.layoutMargins = .init(top: 32, left: 16, bottom: 100, right: 16)
        self.contentStackView.isLayoutMarginsRelativeArrangement = true
        
        self.titleStackView.spacing = 8
        
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
        self.titleLabel.textAlignment = .center
        
        self.underTitleLabel.textColor = Color.darkGrey
        self.underTitleLabel.textAlignment = .center
        self.underTitleLabel.font = UIFont(name: Constants.roboto, size: 16)
        
        self.contentTextView.font = UIFont(name: Constants.roboto, size: 16)
        self.contentTextView.textColor = Color.darkGrey
        self.contentTextView.textAlignment = .justified
        self.contentTextView.isEditable = false
        
        self.buyButton.isEnabled = true
    }
    
    func setupData() {
        self.dataPackageLabel.text = "Data Package"
        self.titleLabel.text = "1GB recurring extra data"
        self.underTitleLabel.text = "with 1GB overcharge"
        self.contentTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel imperdiet odio, non sodales est. Vivamus vitae elementum ex. Sed non quam diam. Maecenas tincidunt euismod odio. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vitae libero luctus, blandit dolor nec, posuere est. Curabitur euismod tellus a tortor pellentesque facilisis. Nullam facilisis aliquam est vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel imperdiet odio, non sodales est. Vivamus vitae elementum ex. Sed non quam diam. Maecenas tincidunt euismod odio. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vitae libero luctus, blandit dolor nec, posuere est. Curabitur euismod tellus a tortor pellentesque facilisis. Nullam facilisis aliquam est vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel imperdiet odio, non sodales est. Vivamus vitae elementum ex. Sed non quam diam. Maecenas tincidunt euismod odio. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vitae libero luctus, blandit dolor nec, posuere est. Curabitur euismod tellus a tortor pellentesque facilisis. Nullam facilisis aliquam est vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel imperdiet odio, non sodales est. Vivamus vitae elementum ex. Sed non quam diam. Maecenas tincidunt euismod odio. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vitae libero luctus, blandit dolor nec, posuere est. Curabitur euismod tellus a tortor pellentesque facilisis. Nullam facilisis aliquam est vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel imperdiet odio, non sodales est. Vivamus vitae elementum ex. Sed non quam diam. Maecenas tincidunt euismod odio. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vitae libero luctus, blandit dolor nec, posuere est. Curabitur euismod tellus a tortor pellentesque facilisis. Nullam facilisis aliquam est vitae."
        self.buyButton.setTitle("Buy", for: .normal)
    }
}
