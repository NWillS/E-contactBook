//
//  NotificationResponse.swift
//  ContactBook
//
//  Created by S N on 2018/01/19.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import SwiftyJSON

class NotificationResponse: NSObject {
    func map(json:Any) -> [NotificationItem] {
        var notificationList: [NotificationItem] = []
        let json = JSON(json)
        json.forEach{(_,rest) in
            let date = rest["date"].string
            let title = rest["title"].string
            let text = rest["text"].string
            
            notificationList.append(NotificationItem(title: title!, text: text!, date: date!))
        }
        return notificationList
    }
}
