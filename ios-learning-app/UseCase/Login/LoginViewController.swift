//
//  ViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModelType!

    @IBOutlet weak var MSISDN: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupStyle()
        self.setupBindings()
    }
    
    private func changeButton(to value: Bool) {
        LoginButton.isEnabled = value
        if (LoginButton.isEnabled) {
            self.LoginButton.backgroundColor = UIColor(named: "VodafoneRed")
        } else {
            self.LoginButton.backgroundColor = UIColor(named: "DisabledButtonGrey")
        }
    }
    
    private func setupBindings() {
        self.MSISDN.rx.text.bind(to: viewModel.msisdnValue).disposed(by: bag)
        self.PasswordLogin.rx.text.bind(to: viewModel.passwordValue).disposed(by: bag)
        
        self.viewModel.fieldsAreValid.observe(on: MainScheduler.instance)
            .subscribe(onNext:  { value in
                self.changeButton(to: value)
            })
            .disposed(by: bag)
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
        self.viewModel.performLogin(msisdn: msisdn) { state in
            switch (state) {
            case .success: self.navigateToDashboard()
            case .failure:
                return
            }
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

