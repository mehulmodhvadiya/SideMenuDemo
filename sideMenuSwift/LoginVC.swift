//
//  LoginVC.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtEmail:UITextField!
    
    @IBOutlet weak var txtPassword:UITextField!
    
    @IBOutlet weak var lblErrorMsg:UILabel!
    
    @IBOutlet weak var lblErrorPass:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=true
        
        txtEmail.cornerReadius(testfield: txtEmail)
        txtPassword.cornerReadius(testfield: txtPassword)
        
        self.txtEmail.setLeftPaddingPoints(10)
        self.txtPassword.setLeftPaddingPoints(10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkValidation()
    {
//        guard let text = txtEmail.text, !text.isEmpty else {
//            return
//        }
//        guard let text1 = txtPassword.text, !text1.isEmpty else {
//            return
//        }
        
        if  txtEmail.text != nil {
            lblErrorMsg.text = "please enter email"
            txtEmail?.layer.borderWidth = 1
            txtEmail?.layer.borderColor = UIColor.red.cgColor

        }
        if  txtPassword.text != nil{
            lblErrorPass.text = "please enter password"
            txtPassword?.layer.borderWidth = 1
            txtPassword?.layer.borderColor = UIColor.red.cgColor
        }
        
        if let text = txtEmail.text {
            print(text)
        }

        if let text1 = txtPassword.text {
            print(text1)
        }
        
        if isValidEmail(testStr:  (txtEmail?.text)!){
            print("Validate EmailID")
            let dashboardObj = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as? DashboardVC
            self.setUpSideMenu()
            self.navigationController?.pushViewController(dashboardObj!, animated: true)

        }else{
            print("invalide EmailID")
        }
    }
    
    @IBAction func loginBtn(_ sender: Any)
    {
        self.checkValidation()
    }
}
extension LoginVC:UITextFieldDelegate{
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == txtEmail {
//            if isValidEmail(testStr: (txtEmail?.text)!)
//            {
//
//            }else{
//                lblErrorMsg.text = "please enter email"
//            }
//        }
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == txtEmail {
//            if isValidEmail(testStr: (txtEmail?.text)!)
//            {
//
//            }else{
//                lblErrorMsg.text = "please enter email"
//            }
//        }
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtEmail {
            if isValidEmail(testStr: (txtEmail?.text)!)
            {
                lblErrorMsg.text = ""
            }else{
                lblErrorMsg.text = "please enter email"
            }
        }
        
        if textField == txtPassword{
            if isPasswordCheck(passwordStr: (txtPassword?.text)!)
            {
                lblErrorMsg.text = ""
            }else{
                lblErrorPass.text = "Minimum 8 characters at least 1 Alphabet and 1 Number:"
            }
        }
        return true
    }
}
