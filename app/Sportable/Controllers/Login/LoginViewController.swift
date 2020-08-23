//
//  LoginViewController.swift
//  Sportable
//
//  Created by Shreeniket Bendre on 8/22/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit
import Alamofire
import AVKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    var emailString = ""
    var passString = ""
    var nameString = ""
    var classString = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AVCaptureDevice.requestAccess(for: .video) { (true) in
            //print("yes")
        }
        // Do any additional setup after loading the view.
        //request()
    }
    
    @IBAction func didTapNext(_ sender: Any){
            
            emailString = email.text!
            passString = pass.text!
            request()
            performSegue(withIdentifier: "land", sender: self)
            
            
            
        }
    //IUAHBKSDFJC@outloook.com
//    ieusacfhkd v
        
        func request(){
            
            let url = "http://parrotnote.de:8080/login"
            let url2 = "http://parrotnote.de:8080/user/class"
            AF.request(URL.init(string: url)!,
                       method: .post,
                       parameters: ["email": "\(emailString)", "password": "\(passString)"],
                       encoding: JSONEncoding.default,
                       headers: nil).responseString { (response) in
                        
                            print(response.result)
                            AF.request(URL.init(string: url2)!,
                            method: .get,
                            encoding: JSONEncoding.default,
                            headers: nil).responseString { (response) in
                             
                                 print(response.result)
                             
                             }
                        
                        }
            

                }
   
    
    
    

}
