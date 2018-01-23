//
//  ContactBookParamsBuilder.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
final class ContactBookParamsBuilder {
    static let hitPerPage = 20
    static func create(id: Int, offset: Int) -> [String:Any] {
        let params = [
            "child_id":id,
            "hitPerPage":hitPerPage,
            "page":offset
            ] as [String : Any]
        return params
    }
}
