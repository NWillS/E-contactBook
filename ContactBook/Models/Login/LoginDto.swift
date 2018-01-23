//
//  LoginDto.swift
//  ContactBook
//
//  Created by S N on 2018/01/16.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//
import Foundation
import RealmSwift

final class LoginDto: Object{
    @objc dynamic var childId = 0
    @objc dynamic var childName = ""
    @objc dynamic var grade = 0
    
    override static func primaryKey() -> String? {
        return "childId"
    }
}

