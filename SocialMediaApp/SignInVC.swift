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
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
            print("ADAM: ID found in keychaing")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
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
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        })
    }
    
    @IBAction func SignInBtn(_ sender: AnyObject) {
        
        if let email = EmailField.text, let pwd = PasswordField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("ADAM: Email user authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                }
                else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error == nil {
                            print("ADAM: Created user successfully")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                        else {
                            print("ADAM: Error creating user - \(error)")
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let resultSignIn: Bool = KeychainWrapper.standard.set(id, forKey: "uid")
        print("ADAM: Able to save in keychain - \(resultSignIn)")
        if resultSignIn {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
        
    }
}

