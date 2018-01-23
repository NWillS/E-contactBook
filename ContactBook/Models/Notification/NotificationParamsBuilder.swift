//
//  NotificationParamsBuilder.swift
//  ContactBook
//
//  Created by S N on 2018/01/19.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

class NotificationParamsBuilder {
    static let hitPerPage = 20
    static func create(grade: Int, offset: Int) -> [String:Any] {
        let params = [
            "grade": grade,
            "hitPerPage": hitPerPage,
            "page": offset
            ] as [String : Any]
        return params
    }
}
