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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostCell
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
