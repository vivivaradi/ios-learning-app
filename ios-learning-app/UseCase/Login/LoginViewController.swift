//
//  ViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModelType!

    @IBOutlet weak var MSISDN: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupStyle()
        self.MSISDN.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        self.PasswordLogin.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    func enableLoginButton() {
        self.LoginButton.isEnabled = true
        self.LoginButton.backgroundColor = UIColor(named: "VodafoneRed")
    }
    
    func disableLoginButton() {
        self.LoginButton.isEnabled = false
        self.LoginButton.backgroundColor = UIColor(named: "DisabledButtonGrey")
    }
    
    @objc func textFieldsDidChange() {
        if (self.MSISDN.isContentValid() && self.PasswordLogin.isContentValid()) {
            enableLoginButton()
        } else {
            disableLoginButton()
        }
    }

    @IBAction func switchPressed(_ sender: UISwitch) {
    }
    
    fileprivate func navigateToDashboard() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as UIViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let msisdn = self.MSISDN.text else {
            return
        }
        self.viewModel.performLogin(msisdn: msisdn)
        if (self.viewModel.hasActiveSession()) {
            navigateToDashboard()
        } else {
            // show error
        }
    }
    
    // MARK: - UI setup
    
    @IBOutlet weak var LoginCard: UIView!
    func setupStyle() {
        self.view.backgroundColor = UIColor(named: "VodafoneRed")
        LoginCard.layer.cornerRadius = 5
        LoginButton.layer.cornerRadius = 5
        self.LoginButton.titleLabel?.font = UIFont(name: Constants.roboto, size: 20)
    }
}

