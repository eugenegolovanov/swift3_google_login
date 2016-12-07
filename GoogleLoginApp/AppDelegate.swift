//
//  AppDelegate.swift
//  GoogleLoginApp
//
//  Created by eugene golovanov on 12/5/16.
//  Copyright © 2016 eugene golovanov. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GIDSignIn.sharedInstance().clientID = "913608986099-rs7hc5nnbo5ojvdf88enguejj33lh2ja.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance().clientID = "project--5661446541868440491"

        return true
    }


    
    
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(
            url,
            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    
    
    
    
    
    
    


}

