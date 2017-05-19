//
//  RoundedButton.swift
//  SocialMediaApp
//
//  Created by Adam Seppi on 5/19/17.
//  Copyright © 2017 AdamSeppi. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    

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
    
}

