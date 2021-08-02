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
    var enabledColor = Color.vodafoneRed
    var disabledColor = Color.lightGrey
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? enabledColor : disabledColor
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont(name: Constants.roboto, size: 20)
        self.setTitleColor(Color.white, for: .normal)
    }
    
    func setMainColor(color: UIColor) {
        self.enabledColor = color
    }
}
