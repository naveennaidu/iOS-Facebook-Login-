//
//  ViewController.swift
//  facebookLogin
//
//  Created by Naveen Naidu  on 21/07/17.
//  Copyright © 2017 Naveen Naidu . All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width-32, height: 50)
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log Out")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        print("Successfully Logged")
        FBSDKGraphRequest(graphPath: "/me", parameters: ["field": "id, name, email"]).start {
            (connection, result, err) in
            if err != nil{
                print("Failed to start graph request: ", err!)
                return
            }
            print(result)
        }
    }



}

