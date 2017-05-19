//
//  ViewController.swift
//  SocialMediaApp
//
//  Created by Adam Seppi on 5/19/17.
//  Copyright © 2017 AdamSeppi. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        
    }


}

