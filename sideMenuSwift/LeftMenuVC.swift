//
//  LeftMenuVC.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tablMenu.dequeueReusableCell(withIdentifier: cellReuseableCell, for: indexPath) as! MenuCell
        cell.lblMenuTitle.text = menuItem[indexPath.row]
        
        tableViewHeightConstraint.constant = tableView.contentSize.height
        
        switch indexPath.row {
        case 0:
            cell.vwbottomLine.isHidden = false
            break
        case 1:
            cell.vwbottomLine.isHidden = false
            break
        case 2:
            cell.vwbottomLine.isHidden = false
            break
        case 3:
            cell.vwbottomLine.isHidden = false
            break
        case 4:
            cell.vwbottomLine.isHidden = true
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.row {
        case 0:
            let profileObj = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
            Constants.appdelegate.centerNavController?.pushViewController(profileObj!, animated: true)
            self.mm_drawerController.closeDrawer(animated: true, completion: nil)
            break
        case 1:
            let profileObj1 = self.storyboard?.instantiateViewController(withIdentifier: "AboutVC") as? AboutVC
            Constants.appdelegate.centerNavController?.pushViewController(profileObj1!, animated: true)
            self.mm_drawerController.closeDrawer(animated: true, completion: nil)
            break
        case 2:
            let profileObj2 = self.storyboard?.instantiateViewController(withIdentifier: "FaqVC") as? FaqVC
            Constants.appdelegate.centerNavController?.pushViewController(profileObj2!, animated: true)
            self.mm_drawerController.closeDrawer(animated: true, completion: nil)
            break
        default:
            break
        }
}
    @IBOutlet weak var tablMenu:UITableView!
    @IBOutlet weak var imageProfile:UIImageView!
    @IBOutlet weak var tableViewHeightConstraint:NSLayoutConstraint!
    
    
    let cellReuseableCell = "cell"

    var menuItem = ["Profile","About","Faq","Help","Contact"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageProfile.layer.cornerRadius = self.imageProfile.layer.cornerRadius/2
        self.imageProfile.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
