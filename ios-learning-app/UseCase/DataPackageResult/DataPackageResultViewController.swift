//
//  DataPackageResultViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 04..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class DataPackageResultViewController: UIViewController {
    
    var viewModel: DataPackageResultViewModelType!
    
    // MARK: - IBOutlet variables
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var myVodafoneLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dataPackageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultDescription: UILabel!
    @IBOutlet weak var dashboardButton: ColorChangingButton!
    
    let bag = DisposeBag()
    
    // MARK: - Configure ViewController
    
    override func viewDidLoad() {
        self.setupStyle()
        
        self.viewModel.result
            .drive(onNext: { [weak self] result in
                guard let self = self else { return }
                self.setupData(item: result)
            }).disposed(by: bag)
        
        self.dashboardButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.popToRootViewController(animated: true)
            }).disposed(by: bag)
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
    
    func setupData(item: DataPackageResultItemViewModel) {
        self.dataPackageLabel.text = "Data Package"
        self.resultLabel.text = item.title
        self.resultDescription.text = item.description
        switch item.status {
        case "success":
            self.resultImageView.image = UIImage(named: "SuccessImage")
        case "failure":
            self.resultImageView.image = UIImage(named: "FailureImage")
        default:
            self.resultImageView.image = UIImage(named: "ImagePlaceholder")
        }
    }
}
