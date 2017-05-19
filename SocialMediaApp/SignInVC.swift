//
//  ViewController.swift
//  SocialMediaApp
//
//  Created by Adam Seppi on 5/19/17.
//  Copyright © 2017 AdamSeppi. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
    }

    @IBAction func FBButtonClicked(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("ADAM: Unable to authenticate with Facebook - \(error)")
            }
            else if result?.isCancelled == true {
                print("ADAM: User Cancelled Auth")
            }
            else {
                print("ADAM: Successfully athenticated with FB")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("ADAM: Unable to authenticate with Firebase - \(error)")
            }
            else {
                print("Adam: Successfully athenticated with Firebase")
            }
        })
    }
    
}

