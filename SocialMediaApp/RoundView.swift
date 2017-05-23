//
//  RoundView.swift
//  SocialMediaApp
//
//  Created by Adam Seppi on 5/21/17.
//  Copyright © 2017 AdamSeppi. All rights reserved.
//

import UIKit

class RoundView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet{
            self.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 0.6).cgColor
        }
    }
    
    @IBInspectable var shadowRad: CGFloat = 0 {
        didSet{
            self.layer.shadowRadius = shadowRad
        }
    }
    
    @IBInspectable var shadowOff: CGSize = CGSize(width: 5, height: 5) {
        didSet{
            self.layer.shadowOffset = shadowOff
        }
    }
    

}
