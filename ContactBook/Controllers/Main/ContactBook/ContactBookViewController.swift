//
//  ContactBookViewController.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit
import STV_Extensions

class ContactBookViewController: UIViewController {
    @IBOutlet weak var contactBookTableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let api = ContactBookApi()
    let user = LoginDao.getData()
    var offset = 0
    
    let datasource = ContactBookProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactBookTableView.dataSource = datasource
        contactBookTableView.delegate = self
        
        indicator.hidesWhenStopped = true
        
        api.delegate = self
//        api.fetch(id: (user?.childId)!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ContactBookViewController:UITableViewDelegate{
    
}
extension ContactBookViewController:ContactBookApiDelegate{
    func received(contactBookList: [ContacBookItem]) {
        if contactBookList.count == datasource.count() {
            DispatchQueue.global().async {
                // 重たい処理
                DispatchQueue.main.async {
                    // UIを更新する処理
                    let indexPath = IndexPath(row: contactBookList.count-1, section: 0)
                    self.contactBookTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        }else{
            datasource.set(contactBookList: contactBookList)
            contactBookTableView.reloadData()
        }
        indicator.stopAnimating()
    }
}
extension ContactBookViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(contactBookTableView.isScrollEnd() && indicator.isAnimating == false){
            indicator.startAnimating()
            api.fetch(id: (user?.childId)!,offset: offset)
            offset += 1
        }
    }
}
