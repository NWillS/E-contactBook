//
//  NotificationItem.swift
//  ContactBook
//
//  Created by S N on 2018/01/19.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

class NotificationItem: NSObject {
    var title = ""
    var text = ""
    var date = ""
    
    init(title: String, text: String, date: String) {
        self.title = title
        self.text = text
        self.date = date
    }
}
