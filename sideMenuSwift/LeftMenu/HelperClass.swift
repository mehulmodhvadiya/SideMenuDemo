//
//  HelperClass.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import Foundation
import UIKit
import MMDrawerController

extension UIViewController {
    // MARK: - Set SideMenu initial point
    func setUpSideMenu()
    {
        let vcDashboard  = viewController(withID:String(describing: DashboardVC.self))
        let navController = UINavigationController()
        navController.viewControllers = [vcDashboard]
        Constants.appdelegate.centerNavController = navController
        
        // Set Navigation Bar
        setNavigation()
        
        let vcDrawer  = viewController(withID:String(describing: LeftMenuVC.self))
        let mmDrawer = MMDrawerController(center: navController, leftDrawerViewController: vcDrawer)
        Constants.mainWindow?.rootViewController = mmDrawer
        Constants.mainWindow?.makeKeyAndVisible()
        mmDrawer?.closeDrawerGestureModeMask = .all
        mmDrawer?.openDrawerGestureModeMask = .all
        mmDrawer?.maximumRightDrawerWidth = self.view.frame.size.width * (240/320)
    }
    func sideMenuSlideOff(){
        if self.mm_drawerController != nil {
            let mmDrawer = mm_drawerController
            mmDrawer?.closeDrawerGestureModeMask = .init(rawValue: 0)
            mmDrawer?.openDrawerGestureModeMask = .init(rawValue: 0)
        }
    }
}
