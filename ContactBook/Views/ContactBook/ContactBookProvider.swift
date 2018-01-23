//
//  ContactBookProvider.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class ContactBookProvider:NSObject{
    var contactBookList:[ContacBookItem] = []
    
    func set(contactBookList:[ContacBookItem]){
        self.contactBookList = contactBookList
    }
    func count() -> Int {
        return contactBookList.count
    }
}
extension ContactBookProvider:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactBookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactBookCell")
        cell?.textLabel?.text = contactBookList[indexPath.row].text
        return cell!
    }
}
