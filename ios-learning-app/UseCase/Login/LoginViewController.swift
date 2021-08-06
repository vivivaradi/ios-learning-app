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
    
    // MARK: - IBOutlet variables

    @IBOutlet weak var msisdnField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: ColorChangingButton!
    @IBOutlet weak var loginCard: UIView!
    @IBOutlet weak var rememberMeLabel: UILabel!
    
    // MARK: - Public variables
    
    var msisdnValue = BehaviorRelay<String?>(value: "")
    var passwordValue = BehaviorRelay<String?>(value: "")
    let bag = DisposeBag()
    
    // MARK: - Configure ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStyle()
        self.setupValidation()
    }
    
    fileprivate func navigateToDashboard() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let msisdn = self.msisdnField.text else {
            return
        }
        self.viewModel.performLogin(msisdn: msisdn).subscribe { _ in
            self.navigateToDashboard()
        } onError: { error in
            print(error)
        }
        .disposed(by: bag)

    }
    
    func setupStyle() {
        self.view.backgroundColor = Color.vodafoneRed
        self.rememberMeLabel.textColor = Color.mediumGrey
        self.rememberMeLabel.font = UIFont(name: Constants.roboto, size: 14)
        self.loginCard.layer.cornerRadius = 5
        
    }
}

// MARK: - Setup validation for login

extension LoginViewController {
    
    private func setupValidation() {
        self.msisdnField.rx.text.bind(to: msisdnValue).disposed(by: bag)
        self.passwordField.rx.text.bind(to: passwordValue).disposed(by: bag)
        
        let fieldsAreValid: Observable<Bool> = Observable.combineLatest(msisdnValue, passwordValue) { msisdn, password in
                guard let msisdn = msisdn, let password = password else {
                    return false
                }
                return msisdn.isMsisdnValid() && password.isPasswordValid()
            }
        
        fieldsAreValid.bind(to: self.loginButton.rx.isEnabled).disposed(by: bag)
    }
}
