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



// create validation function

func isValidEmail(testStr:String) -> Bool {
    
    print("validate emilId: \(testStr)")
    let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: testStr)
    return result
}

func isPasswordCheck(passwordStr:String)-> Bool{
    let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
    let result = emailTest.evaluate(with: passwordStr)
    return result
}

func validate(value: String) -> Bool {
    let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: value)
    return result
}

func isValidPincode(value: String) -> Bool {
    if value.characters.count == 6{
        return true
    }
    else{
        return false
    }
}

func isPasswordSame(password: String , confirmPassword : String) -> Bool {
    if password == confirmPassword{
        return true
    }else{
        return false
    }
}

func isPwdLenth(password: String , confirmPassword : String) -> Bool {
    if password.characters.count <= 7 && confirmPassword.characters.count <= 7{
        return true
    }else{
        return false
    }
}


