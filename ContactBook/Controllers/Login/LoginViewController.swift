//
//  LoginViewController.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit
import Alertift

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    let api = LoginApi()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userData = LoginDao.getData(){
            print(userData)
            loginSuccess()
        }
        api.delegate = self
        
        indicator.hidesWhenStopped = true
        
        passTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        let id = idTextField.text
        let password = passTextField.text
        idTextField.isEnabled = false
        passTextField.isEnabled = false
        loginButton.isEnabled = false
        indicator.startAnimating()
        api.fetch(id: id!, password: password!)
    }
}

extension LoginViewController:LoginApiDelegate{
    func loginSuccess() {
        indicator.stopAnimating()
        
        idTextField.isEnabled = true
        passTextField.isEnabled = true
        loginButton.isEnabled = true
        DispatchQueue.global(qos: .default).async {
            // サブスレッド(バックグラウンド)で実行する方を書く
            DispatchQueue.main.async {
                let homeSB = UIStoryboard(name: "Home", bundle: nil)
                let homeVC = homeSB.instantiateInitialViewController()
                self.present(homeVC!, animated: true, completion: nil)
            }
        }
        
//        self.
    }
    
    func receivedError(errorCode: Int, error: String) {
        indicator.stopAnimating()
        Alertift.alert(title: "エラーコード:\(errorCode)", message: "\(error)").action(.cancel("OK")).show()
        
        idTextField.isEnabled = true
        passTextField.isEnabled = true
        loginButton.isEnabled = true
    }
    
}
