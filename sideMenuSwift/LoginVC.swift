//
//  LoginVC.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginBtn(_ sender: Any) {
        let dashboardObj = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as? DashboardVC
        self.setUpSideMenu()
        self.navigationController?.pushViewController(dashboardObj!, animated: true)
        
    }
    
}
