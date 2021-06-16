//
//  ViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var MSISDN: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    let networkProvider = NetworkManager.shared.provider
    let sessionManager = SessionManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupStyle()
        MSISDN.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
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
        if (MSISDN.isContentValid() && PasswordLogin.isContentValid()) {
            enableLoginButton()
        } else {
            disableLoginButton()
        }
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let msisdn = MSISDN.text!
        networkProvider.request(LoginAPI.loginUser(msisdn: msisdn)) { result in
            switch result {
            case let .success(response): {
                sessionManager.startSession(token: response.data.accessToken, telnum: msisdn)
                let dashboard = UIStoryboard(name: "Login", bundle: nil)
                let dashboardViewController = dashboard.instantiateViewController(withIdentifier: "DashboardVC") as UIViewController
                present(dashboardViewController, animated: true, completion: nil)
            }
                
            }
        }
    }
    
    // MARK: - UI setup
    
    @IBOutlet weak var LoginCard: UIView!
    func setupStyle() {
        self.view.backgroundColor = UIColor(named: "VodafoneRed")
        LoginCard.layer.cornerRadius = 5
        LoginButton.layer.cornerRadius = 5
    }
}

