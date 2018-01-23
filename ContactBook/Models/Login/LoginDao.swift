//
//  LoginDao.swift
//  ContactBook
//
//  Created by S N on 2018/01/16.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

final class LoginDao{
    static let daoHelper = RealmDaoHelper<LoginDto>()
    
    static func registerData(childData:LoginDto){
        let data = LoginDto()
        data.childId = childData.childId
        data.childName = childData.childName
        data.grade = childData.grade
        
        daoHelper.add(object: data)
    }
    
    static func deleteData(){
        guard let data = daoHelper.findFirst() else{
            return
        }
        daoHelper.delete(object: data)
    }
    
    static func getData() -> LoginDto?{
        guard let data = daoHelper.findFirst() else{
            return nil
        }
        return data
    }
}
