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
    let red = UIColor(named: "VodafoneRed")
    let gray = UIColor(named: "DisabledButtonGrey")
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? red : gray
        }
    }
}
