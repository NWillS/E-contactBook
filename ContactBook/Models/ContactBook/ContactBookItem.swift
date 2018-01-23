//
//  ContactBookItem.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

class ContacBookItem: NSObject {
    var date:String = ""
    var text:String = ""
    
    init(date: String,text: String) {
        self.date = date
        self.text = text
    }
}
