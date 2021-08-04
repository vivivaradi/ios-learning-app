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
}
