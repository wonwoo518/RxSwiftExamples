//
//  LoginViewModel.swift
//  RxSwiftTutorial
//
//  Created by 1002237 on 2018. 2. 23..
//  Copyright © 2018년 1002237. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel{
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid:Observable<Bool>{
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()){ email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
