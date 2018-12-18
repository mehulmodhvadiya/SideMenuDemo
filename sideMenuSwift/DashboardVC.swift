//
//  DashboardVC.swift
//  sideMenuSwift
//
//  Created by Verve Mac on 10/12/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit
import MMDrawerController

class DashboardVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image:UIImageView!
    
    var picker = UIImagePickerController()
    var url: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary

        
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
    
    @IBAction func selectPicture(sender: AnyObject) {
        
            self.openGallary()
    }
    
    @IBAction func uploadPictureInserver(sender: AnyObject) {
        
        self.UploadRequest()
    }
    
//    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//
//        image.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        self.dismiss(animated: true, completion: nil)
//
//    }
    
    
    func openGallary()
    {
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    // PickerView Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        picker .dismiss(animated: true, completion: nil)
        url = info[UIImagePickerControllerImageURL] as? URL
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        image.image = chosenImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("picker cancel.")
    }

    
    func UploadRequest()
    {
        let url = NSURL(string: "http://192.168.1.127/lokaly/api/user/test")
        
        let request = NSMutableURLRequest(url: url! as URL as URL)
        request.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        
        //define the multipart request type
        

        
        if (image.image == nil)
        {
            return
        }
        
        let image_data = UIImageJPEGRepresentation(image.image!, 0.5)
        
        
        if(image_data == nil)
        {
            return
        }
        let param:[String:String]=[String:String]()
        
//        let body = NSMutableData()
        
        let fname = "test.png"
        let mimetype = "image/jpg"
        
        //define the data post parameter
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createBody(parameters: param, boundary: boundary, data: image_data!, mimeType: mimetype, filename: fname)
        
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(String(body.length), forHTTPHeaderField: "Content-Length")
//
//        body.append(String("--\(boundary)\r\n").data(using: .utf8)!)
//        body.append(String("Content-Disposition:form-data; name=\"test\"\r\n\r\n").data(using: .utf8)!)
//        body.append(String("hi\r\n").data(using: .utf8)!)
//
//
//
//        body.append(String("--\(boundary)\r\n").data(using: .utf8)!)
//        body.append(String("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n").data(using: .utf8)!)
//        body.append(String("Content-Type: \(mimetype)\r\n\r\n").data(using: .utf8)!)
//        body.append(image_data!)
//        body.append(String("\r\n").data(using: .utf8)!)
//
//
//        body.append(String("--\(boundary)--\r\n").data(using: .utf8)!)
//
//
//
//        request.httpBody = body as Data
        
        
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request as URLRequest) {
            (
            data, response, error) in
            let responseString = String(data: data!, encoding: .utf8)

            let json = (try? JSONSerialization.jsonObject(with: data!, options: [])) as? [String:AnyObject]
            print(json ?? "Empty Data")
            print("json value \(json)")
        }
        
        task.resume()
        
        
    }
    
    func uploadImageOne(){
        
        let imageData = UIImageJPEGRepresentation(image.image!, 0.5)//Replace your image
        
        if imageData != nil{
            var request = URLRequest(url: NSURL(string:"http://192.168.1.127/lokaly/api/user/test")! as URL)//Send your URL here
            print(request)
            
            let fname = "test.png"
            let mimetype = "image/png"

            
            request.httpMethod = "POST"
            
            let boundary = NSString(format: "---------------------------14737809831466499882746641449")
            let contentType = NSString(format: "multipart/form-data; boundary=%@",boundary)
            //  println("Content Type \(contentType)")
//            request.addValue(contentType as String, forHTTPHeaderField: "Content-Type")
            
            var body = Data()
            
            body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
//            body.append("Content-Disposition:form-data; name=\"test\"\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append("Hello".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
//            body.append(String(format:"Content-Disposition: form-data;name=\"uploaded_file\";filename=\"image.jpg\"\\r\n").data
//                (using:.utf8)!) //Here replace your image name and file name
            body.append(String(format: "Content-Type: image/jpeg\r\n\r\n").data(using:  .utf8)!)
            body.append(imageData!)
            body.append(String(format: "\r\n--%@\r\n", boundary).data(using:  .utf8)!)
            
            request.httpBody = body
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in guard let data = data, error == nil
                else { // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 500 {
                } else if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 { // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }
                
                //This can print your response in string formate
                let responseString = String(data: data, encoding: .utf8)
                //            let dictionary = data
                //            print("dictionary = \(dictionary)")
                print("responseString = \(String(describing: responseString!))")
                
                do {
                    let response3 = (try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject])!
                    print(response3)
                    
                } catch let error as NSError {
                    print(error)
                    print(error.localizedDescription)
                }
            }
            
            task.resume()
            
        }
        
    }
    
    
    func createBody(parameters: [String: String],
                    boundary: String,
                    data: Data,
                    mimeType: String,
                    filename: String) -> Data {
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
//        for (key, value) in parameters {
//            body.appendString(boundaryPrefix)
//            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
//            body.appendString("\(value)\r\n")
//        }
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }

}
extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
