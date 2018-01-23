//
//  NotificationViewController.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit
import STV_Extensions

class NotificationViewController: UIViewController {
    @IBOutlet weak var notificationTableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    let datasource = NotificationProvider()
    let api = NotificationApi()
    let user = LoginDao.getData()
    var offset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationTableView.dataSource = datasource
        notificationTableView.delegate = self
        
        api.delegate = self
        
        indicator.hidesWhenStopped = true
        
        add()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension NotificationViewController: UITableViewDelegate {
    
}
extension NotificationViewController: NotificationApiDelegate{
    func received(notificationList: [NotificationItem]) {
        if notificationList.count == datasource.count() {
            DispatchQueue.global().async {
                // 重たい処理
                DispatchQueue.main.async {
                    // UIを更新する処理
                    let indexPath = IndexPath(row: notificationList.count-1, section: 0)
                    self.notificationTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        } else {
            datasource.set(notificationList: notificationList)
            notificationTableView.reloadData()
        }
        indicator.stopAnimating()
    }
}
extension NotificationViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(notificationTableView.isScrollEnd() && indicator.isAnimating == false){
            add()
        }
    }
    func add(){
        indicator.startAnimating()
        api.fetch(grade: (user?.grade)!, offset: offset)
        offset += 1
    }
}
