//
//  DashboardVC.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit
import MMDrawerController

class DashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dashboard"
        
        let newBtn = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(anotherMethod))
        self.navigationItem.leftBarButtonItem = newBtn
        
        let newBtn1 = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(anotherMethod1))
        self.navigationItem.rightBarButtonItem = newBtn1
        
        if mm_drawerController != nil
        {
            self.mm_drawerController.openDrawerGestureModeMask = .all
            self.mm_drawerController.closeDrawerGestureModeMask = .all
        }
    }
    @objc func anotherMethod() {
         self.mm_drawerController.toggle(.left, animated: true, completion: nil)
     }
     @objc func anotherMethod1() {
        Constants.appdelegate.centerNavController = nil
        let loginRoot = viewController(withID: "LoginNavVC")
        Constants.mainWindow?.rootViewController = loginRoot
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
