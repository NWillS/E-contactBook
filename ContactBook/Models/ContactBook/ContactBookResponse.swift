//
//  ContactBookResponse.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import SwiftyJSON

class ContactBookResponse: NSObject {
    var contactBookList:[ContacBookItem] = []
    func map(json:Any) -> [ContacBookItem] {
        let json = JSON(json)
        json.forEach{(_,rest) in
            let date = rest["date"].string
            let text = rest["text"].string
            
            contactBookList.append(ContacBookItem(date: date!,text: text!))
        }
        return contactBookList
    }
}
