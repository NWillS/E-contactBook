//
//  HomeViewController.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit
import Alertift

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tappedLogoutButton(_ sender: UIButton) {
        Alertift.alert(title: "ログアウト", message: "ログアウトしますか？")
        .action(.cancel("キャンセル"))
            .action(.destructive("ログアウト"), handler: { (_, _, _) in
                LoginDao.deleteData()
                self.dismiss(animated: true, completion: nil)
            })
        .show(on: self, completion: nil)
    }

}
