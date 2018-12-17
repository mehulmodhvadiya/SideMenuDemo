//
//  WSCalls.swift
//  Abc
//
//  Created by Vishal Nandoriya on 2/15/18.
//  Copyright © 2018 Abc. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire
import Toast_Swift

typealias SuccessCompletionBlock = ((_ reponse : DataResponse<Any>) ->())
typealias ErrorCompletionBlock = ((_ reponse : DataResponse<Any>) ->())

typealias FailureCompletionBlock = ((String) ->())

class WSCalls: NSObject {
    
    static let sharedInstance = WSCalls()
    
    func callWebService(url: String, httpMethod: HTTPMethod, params: Parameters, isHeaderType : Bool, successHandler : @escaping SuccessCompletionBlock,errorHandler : @escaping ErrorCompletionBlock, failureHandler : @escaping FailureCompletionBlock){
        
        //Check newtwork connection
        guard NetworkConnectivity.isConnectedToInternet() else{
            AppDelegate.mainWindow().makeToast(kNoInternetConnection)
            return
        }
        SVProgressHUD.show()
        var headers:[String:String] = [:]

        debugPrint("URL:\(url)\nRequest Parameters:\(params)\nHeaders Parameters:\(headers)")
        
        if isHeaderType {
            headers = ["":""]
        }
        Alamofire.request(url, method: httpMethod, parameters: (params.count > 0) ? params : nil , encoding: JSONEncoding.default, headers: (headers.count > 0) ? headers : nil).responseJSON { (response) in
            SVProgressHUD.dismiss()
            switch (response.result){
            case .success(_):
                if response.response?.statusCode == 200{
//                    if let data = response.result.value{
//                        if let jsonResponse = data as? [String : AnyObject]{
//                            if let success = jsonResponse["IsSuccess"] as? Bool{
//                                if success{
//                                    successHandler(response)
//                                }
//                                else{
//                                    errorHandler(response)
//                                }
//                            }
//                        }
//                    }
                    print(response)
                    successHandler(response)
                }
                else{
                    errorHandler(response)
                }
                
                break
                
            case .failure(_):
                if let data = response.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    print("Failure Response: \(String(describing: json))")
                }
                failureHandler(response.result.error!.localizedDescription)
                break
            }
        }
        
    }
    
    func uploadImageWithParams(url: String, httpMethod: HTTPMethod, params: Parameters, image : UIImage,imageName : String, isHeaderType : Bool, successHandler : @escaping SuccessCompletionBlock,errorHandler : @escaping ErrorCompletionBlock, failureHandler : @escaping FailureCompletionBlock){
        
        //Check newtwork connection
        guard NetworkConnectivity.isConnectedToInternet() else{
            AppDelegate.mainWindow().makeToast(kNoInternetConnection)
            return
        }
        SVProgressHUD.show()
        var headers:[String:String] = [:]
        
        debugPrint("URL:\(url)\nRequest Parameters:\(params)\nHeaders Parameters:\(headers)")
        
        if isHeaderType {
            headers = ["":""]
        }
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key, value) in params {
                multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue))!, withName: key)
            }
            if let imageData = UIImagePNGRepresentation(image) {
                multipartFormData.append(imageData, withName: imageName, fileName:self.getImageName(), mimeType: "image/png")
            }
        }, to: url, method: .post, headers: nil,
           encodingCompletion: { encodingResult in
            SVProgressHUD.dismiss()
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON {
                    response in
                    switch(response.result) {
                    case .success(_):
                        if let data = response.result.value{
                            if let jsonResponse = data as? [String : AnyObject]{
                                print("Response \(jsonResponse)")
                                if let success = jsonResponse["IsSuccess"] as? Bool{
                                    if success{
                                       successHandler(response)
                                    }
                                    else{
                                       successHandler(response)
                                    }
                                }
                            }
                        }
                        break
                        
                    case .failure(_):
                        if let data = response.data {
                            let json = String(data: data, encoding: String.Encoding.utf8)
                            print("Failure Response: \(String(describing: json))")
                        }
                        failureHandler(response.result.error!.localizedDescription)
                        break
                    }
                }
            case .failure(let encodingError):
                failureHandler(encodingError.localizedDescription)
            }
        })
    }
    
    func getImageName() -> String{
        return "\(NSTimeIntervalSince1970).png"
    }
}


