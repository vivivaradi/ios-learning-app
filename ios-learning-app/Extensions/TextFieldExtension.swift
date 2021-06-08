//
//  TextFieldExtension.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func isContentValid() -> Bool {
        if (self.textContentType == UITextContentType.password && self.text != nil) {
            if (self.text!.count >= 6) {
                return true
            }
        }
        if (self.textContentType == UITextContentType.telephoneNumber && self.text != nil) {
            let telNumPattern = #"^\S+@\S+\.\S+$"# //TODO
            let result = self.text?.range(of: telNumPattern, options: .regularExpression)
            return result != nil
        }
        return false
    }
}
