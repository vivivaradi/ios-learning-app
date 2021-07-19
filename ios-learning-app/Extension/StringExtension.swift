//
//  StringExtension.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 19..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

extension String {
    func isMsisdnValid() -> Bool {
        let telNumPattern = "(20|30|31|50|70)([0-9]{7})$"
        let result = self.range(of: telNumPattern, options: .regularExpression)
        return result != nil
    }
    
    func isPasswordValid() -> Bool {
        return self.count >= 6
    }
}
