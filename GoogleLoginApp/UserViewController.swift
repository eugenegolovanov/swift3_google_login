//
//  ViewController.swift
//  GoogleLoginApp
//
//  Created by eugene golovanov on 12/5/16.
//  Copyright © 2016 eugene golovanov. All rights reserved.
//

import UIKit
import GoogleSignIn

class UserViewController: UIViewController {

    var loginvc:LoginVC? = nil
    
    @IBOutlet weak var labelUserInfo: UILabel!
    var userInfoString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelUserInfo.text = self.userInfoString
    }

    @IBAction func onLogout(_ sender: UIButton) {
        print("|----------Logout Clicked:------------|")
        
        if let vc = self.loginvc {
            vc.logout()
            performSegue(withIdentifier: "logouSegue", sender: nil)
        }
    }


}

