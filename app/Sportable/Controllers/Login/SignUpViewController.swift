//
//  SignUpViewController.swift
//  Sportable
//
//  Created by Shreeniket Bendre on 8/22/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var classRoom: UITextField!
    
    var emailString = ""
    var passString = ""
    var nameString = ""
    var classString = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapNext(_ sender: Any){
        
        emailString = email.text!
        passString = pass.text!
        nameString = name.text!
        classString = classRoom.text!
        request()
        
    }
    
    func request(){
        let url = "http://parrotnote.de:8080/signup"
    AF.request(URL.init(string: url)!, method: .post, parameters: ["name": "\(nameString)", "email": "\(emailString)", "password": "\(passString)", "classroom": "\(classString)"]
, encoding: JSONEncoding.default, headers: nil).responseString { (response) in
        print(response.result)
        }
    }
    
//    func uploadVideo(videoUrl: NSURL) { // local video file path..
//        let timestamp = NSDate().timeIntervalSince1970 // just for some random name.
//
//        AF.upload(multipartFormData: { (multipartFormData) in
//            multipartFormData.append(videoUrl as URL, withName: "picture", fileName: "\(timestamp).MOV", mimeType: "\(timestamp)/mov")
//        }, to: "http://parrotnote.de:8888/postImage").responseJSON { (response) in
//            debugPrint(response)
//        }
//    }
    
    
    
}
