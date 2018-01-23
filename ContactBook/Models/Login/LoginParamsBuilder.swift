//
//  LoginParamsBuilder.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
final class LoginParamsBuilder {
    static func create(id:String,password:String) -> [String:Any]{
        let params = [
            "id":id,
            "password":password
        ]
        return params
    }
}
