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

    @IBOutlet weak var msisdnField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: ColorChangingButton!
    
    var msisdnValue = BehaviorRelay<String?>(value: "")
    var passwordValue = BehaviorRelay<String?>(value: "")
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupStyle()
        self.setupValidation()
    }
    
    fileprivate func navigateToDashboard() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as UIViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let msisdn = self.msisdnField.text else {
            return
        }
        self.viewModel.performLogin(msisdn: msisdn) { state in
            switch (state) {
            case .success:
                self.navigateToDashboard()
            case .failure:
                return
            }
        } 
    }
    
    // MARK: - UI setup
    
    @IBOutlet weak var loginCard: UIView!
    func setupStyle() {
        self.view.backgroundColor = UIColor(named: "VodafoneRed")
        loginCard.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        self.loginButton.titleLabel?.font = UIFont(name: Constants.roboto, size: 20)
    }
}

extension LoginViewController {
    
    var fieldsAreValid: Observable<Bool> {
        return Observable.combineLatest(msisdnValue, passwordValue) { msisdn, password in
            guard let msisdn = msisdn, let password = password else {
                return false
            }
            return msisdn.isMsisdnValid() && password.isPasswordValid()
        }
    }
    
    private func setupValidation() {
        self.msisdnField.rx.text.bind(to: msisdnValue).disposed(by: bag)
        self.passwordField.rx.text.bind(to: passwordValue).disposed(by: bag)
        
        fieldsAreValid.bind(to: self.loginButton.rx.isEnabled).disposed(by: bag)
    }
}

