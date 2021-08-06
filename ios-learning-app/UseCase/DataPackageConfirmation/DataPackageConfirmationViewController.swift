//
//  DataPackageConfirmationViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 02..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class DataPackageConfirmationViewController: UIViewController {
    
    var viewModel: DataPackageConfirmationViewModelType!
    
    // MARK: IBOutlet variables
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var myVodafoneLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var dataPackageLabel: UILabel!
    @IBOutlet weak var confirmationTextLabel: UILabel!

    @IBOutlet weak var yesButton: ColorChangingButton!
    @IBOutlet weak var noButton: ColorChangingButton!
    
    let bag = DisposeBag()
    
    // MARK: Configure ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        
        self.viewModel.packageData
            .drive(onNext: { [weak self] packageName in
                guard let self = self else { return }
                self.setupData(packageName: packageName)
            }).disposed(by: bag)
        
        self.noButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            }).disposed(by: bag)
        
        self.yesButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.navigateTo(storyboard: "Dashboard", withIdentifier: "DataPackageResultViewController")
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
        
        self.confirmationTextLabel.font = UIFont(name: Constants.roboto, size: 24)
        self.confirmationTextLabel.textAlignment = .center
        self.confirmationTextLabel.textColor = Color.darkGrey
        self.confirmationTextLabel.numberOfLines = 0
        self.confirmationTextLabel.lineBreakMode = .byWordWrapping
        
        self.yesButton.setTitle("Yes", for: .normal)
        self.yesButton.isEnabled = true
        self.noButton.setMainColor(color: Color.lightGrey)
        self.noButton.setTitle("No thanks", for: .normal)
        self.noButton.isEnabled = true
    }
    
    func setupData(packageName: String?) {
        self.dataPackageLabel.text = "Data Package"
        self.confirmationTextLabel.text = "Are you sure you want to activate \(packageName ?? "")?"
    }
    
    func navigateTo(storyboard name: String, withIdentifier id: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id) as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
