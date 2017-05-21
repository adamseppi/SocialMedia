//
//  FeedVC.swift
//  SocialMediaApp
//
//  Created by Adam Seppi on 5/21/17.
//  Copyright © 2017 AdamSeppi. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signOutPressed(_ sender: AnyObject) {
        
        print("ADAM: Signing out")
        let signOutResults: Bool = KeychainWrapper.standard.removeObject(forKey: "uid")
        if signOutResults {
            try! Auth.auth().signOut()
            performSegue(withIdentifier: "goToSignIn", sender: nil)
        }
    }
}
