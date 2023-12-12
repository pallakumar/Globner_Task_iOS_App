//
//  UIViewController+Extensions.swift
//  Globner_Task
//
//  Created by apple on 12/12/23.
//

import UIKit
import Swinject

extension UIViewController {
    
    var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    var container: Container {
        appDelegate.container
    }
    
}
