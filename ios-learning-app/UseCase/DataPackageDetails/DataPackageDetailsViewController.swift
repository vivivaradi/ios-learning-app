//
//  DataPackageDetailsViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class DataPackageDetailsViewController: UIViewController {
    
    var viewModel: DataPackageDetailsViewModelType!
    
    //MARK: IBOutlet variables
    
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
    
    let bag = DisposeBag()
    
    //MARK: Configure ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        
        self.viewModel.packageData
            .drive(onNext: { [weak self] item in
                guard let self = self else { return }
                self.setupData(item: item)
            }).disposed(by: bag)
        
        self.buyButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.storePackageName(name: self.titleLabel.text ?? "")
                self.navigateTo(storyboard: "Dashboard", withIdentifier: "DataPackageConfirmationViewController")
            }).disposed(by: bag)
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
        self.contentTextView.textAlignment = .center
        self.contentTextView.isEditable = false
        self.contentTextView.isScrollEnabled = false
        
        self.buyButton.isEnabled = true
    }
    
    func setupData(item: DataPackageDetailsItemViewModel) {
        self.dataPackageLabel.text = "Data Package"
        self.titleLabel.text = item.name
        self.contentTextView.text = item.description
        self.buyButton.setTitle("Buy (\(item.price)Ft)", for: .normal)
    }
    
    func navigateTo(storyboard name: String, withIdentifier id: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id) as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
