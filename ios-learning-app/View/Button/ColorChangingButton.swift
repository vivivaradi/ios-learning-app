//
//  ColorChangingButton.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 20..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit

class ColorChangingButton: UIButton {
    let red = Color.vodafoneRed
    let gray = Color.lightGrey
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? red : gray
        }
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont(name: Constants.roboto, size: 20)
    }
}
