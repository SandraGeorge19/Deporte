//
//  UIView.swift
//  Deporte
//
//  Created by sandra on 1/31/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var radius : CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            //self.layer.masksToBounds = !shadow
//            if shadow{
//                self.layer.masksToBounds = false
//            }else{
//                self.layer.masksToBounds = true
//            }
        }
    }
    
//    @IBInspectable var shadow : Bool{
//        get{
//            return self.layer.shadowOpacity > 0
//        }
//        set{
//            if newValue == true {
//                addShadow()
//            }
//
//        }
//    }
//
//    func addShadow(){
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        self.layer.shadowRadius = 10.0
//        self.layer.shadowOpacity = 5.0
//
//    }
}
