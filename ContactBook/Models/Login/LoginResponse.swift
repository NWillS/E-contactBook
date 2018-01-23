//
//  LoginResponse.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginResponse:NSObject{
    
    func map(json:Any) -> (String,String)?{
        let json = JSON(json)
        let res = json[0]
        if(res["response"].string == "error"){
            let errorCode = res["errorCode"].string
            let error = res["error"].string
            return (errorCode!,error!)
        }
        let responseData = res["responseData"][0]
        let loginData = LoginDto()
        loginData.childId = Int(responseData["child_id"].string!)!
        loginData.childName = responseData["name"].string!
        loginData.grade = responseData["grade"].int!
        
        LoginDao.registerData(childData: loginData)
        return nil
    }
}
