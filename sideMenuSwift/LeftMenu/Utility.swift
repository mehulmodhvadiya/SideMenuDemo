//
//  Utility.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import Foundation
import UIKit

func setNavigation(){
    Constants.appdelegate.centerNavController?.navigationBar.barTintColor = UIColor.white
    Constants.appdelegate.centerNavController?.navigationBar.tintColor = UIColor.black
    Constants.appdelegate.centerNavController?.navigationBar.isTranslucent = false
//    Constants.appdelegate.centerNavController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: ., size: 18)!,NSAttributedStringKey.foregroundColor: UIColor.black]
}
func viewController(withID ID : String) -> UIViewController {
    let controller = Constants.mainStoryboard.instantiateViewController(withIdentifier: ID)
    return controller
}
