//
//  ViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EmailLogin: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func enableButton() {
        LoginButton.isEnabled = true
        LoginButton.backgroundColor = UIColor(named: "VodafoneRed")
    }
    
    func disableButton() {
        LoginButton.isEnabled = false
        LoginButton.backgroundColor = UIColor(named: "DisabledButtonGrey")
    }

    @IBAction func switchPressed(_ sender: UISwitch) {
        if (sender.isOn){
            enableButton()
        } else {
            disableButton()
        }
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
}

