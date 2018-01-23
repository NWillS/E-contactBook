//
//  LoginApi.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

protocol LoginApiDelegate {
    func receivedError(errorCode:Int,error:String)
    func loginSuccess()
}

final class LoginApi{
    var delegate:LoginApiDelegate!
    let loginResponse = LoginResponse()
    
    func fetch(id:String,password:String){
        let router = Router.login(LoginParamsBuilder.create(id: id, password: password))
        APIClient().request(router: router){ [weak self] (response) in
            switch response {
            case .success(let result):
                let error = self?.loginResponse.map(json: result)
                if((error) != nil){
                    self?.delegate.receivedError(errorCode: Int(error!.0)!, error: error!.1)
                }
                self?.delegate.loginSuccess()
            case .failure(let error):
                print(error)
            }
        }
    }
}
