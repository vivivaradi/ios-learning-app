//
//  ViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit
import Moya

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModelType

    @IBOutlet weak var MSISDN: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    @IBOutlet weak var LoginButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupStyle()
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

    @IBAction func switchPressed(_ sender: UISwitch) {
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let msisdn = MSISDN.text!
        networkProvider.request(MultiTarget(LoginAPI.loginUser(msisdn: msisdn))) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let successfulResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try successfulResponse.map(LoginResponse.self)
                    self.sessionManager.startSession(token: data.accessToken, telnum: msisdn)
                } catch let error {
                    print(error)
                }

                // do something in your app
            case let .failure(error):
                print(error)
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

