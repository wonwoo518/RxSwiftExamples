//
//  ViewController.swift
//  RxSwiftTutorial
//
//  Created by 1002237 on 2018. 2. 23..
//  Copyright © 2018년 1002237. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var lgoinEnabledLabel:UILabel!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = emailTextField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.passwordText)
        
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext:{ [unowned self] isValid in
            self.lgoinEnabledLabel.text = isValid ? "Enabled"  : "Not Enabled"
            self.lgoinEnabledLabel.textColor = isValid ? .green : .red
            print("isValid = \(isValid)")
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

