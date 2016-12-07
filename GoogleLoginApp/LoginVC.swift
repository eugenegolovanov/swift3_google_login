//
//  LoginVC.swift
//  GoogleLoginApp
//
//  Created by eugene golovanov on 12/6/16.
//  Copyright © 2016 eugene golovanov. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
//        GIDSignIn.sharedInstance().scopes = [ "profile", "email"]
        
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.green
        myLoginButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-40, height: 40)
        myLoginButton.center = view.center;
        myLoginButton.setTitle("Google custom login", for: .normal)
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        view.addSubview(myLoginButton)


    }
    
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Login/Logout

    
    @objc func loginButtonClicked() {

        print("\n LOGIN Clicked \n")
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logout(){
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().disconnect()
    }
    
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - -Google Delegate Methods-
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        
        
        
        if let error = error {
            print("==ERROR:   \(error)")
            return
        }
        
        guard let idToken = user.authentication.idToken else {print("no idToken");return}
        guard let userId = user.userID else {print("no userId");return}
        guard let email = user.profile.email else {print("no email");return}
        guard let name = user.profile.name else {print("no name");return}
        guard let givenName = user.profile.givenName else {print("no givenName");return}
        guard let familyName = user.profile.familyName else {print("no familyName");return}

        
        print("|----------------------------------------------------------------------------------------------|")
        print("Google idToken:\(idToken)")
        print("Google userId:\(userId)")
        print("Google email:\(email)")
        print("Google name:\(name)")
        print("Google givenName:\(givenName)")
        print("Google familyName:\(familyName)")
        print("|----------------------------------------------------------------------------------------------|")
        
        let str = "Google userId:\(userId)\nGoogle email:\(email)\nGoogle name:\(name)\nGoogle givenName:\(givenName)\nGoogle familyName:\(familyName)"

        self.performSegue(withIdentifier: "loginSegue", sender: str)
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("\nDisconnected SUCCESSFULLY\n")
    }


    //------------------------------------------------------------------------------------------------------
    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            guard let vc = segue.destination as? UserViewController else{print("no controller");return}
            guard let str = sender as? String else {print("no info");return}
            vc.userInfoString = str
            vc.loginvc = self
        }
    }

   
}
