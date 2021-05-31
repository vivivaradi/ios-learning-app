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
        EmailLogin.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        PasswordLogin.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    func enableLoginButton() {
        LoginButton.isEnabled = true
        LoginButton.backgroundColor = UIColor(named: "VodafoneRed")
    }
    
    func disableLoginButton() {
        LoginButton.isEnabled = false
        LoginButton.backgroundColor = UIColor(named: "DisabledButtonGrey")
    }
    
    @objc func textFieldsDidChange() {
        if (EmailLogin.isContentValid() && PasswordLogin.isContentValid()) {
            enableLoginButton()
        } else {
            disableLoginButton()
        }
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
}

