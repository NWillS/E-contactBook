//
//  NotificationProvider.swift
//  ContactBook
//
//  Created by S N on 2018/01/19.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class NotificationProvider: NSObject {
    var notificationList: [NotificationItem] = []
    func set(notificationList: [NotificationItem]){
        self.notificationList = notificationList
    }
    func count() -> Int {
        return notificationList.count
    }
}
extension NotificationProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! NotificationTableViewCell
        
        cell.date.text = notificationList[indexPath.row].date
        cell.title.text = notificationList[indexPath.row].title
        cell.notificationText.text = notificationList[indexPath.row].text
        
        return cell
    }
    
    
}
