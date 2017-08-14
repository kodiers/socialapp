//
//  SignInVC.swift
//  socialapp
//
//  Created by Viktor Yamchinov on 10/08/2017.
//  Copyright © 2017 Viktor Yamchinov. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) {(result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook -- \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("User canceled Facebook authetication")
            } else {
                print("Successfully autheticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("Unable to autheticate with Firebase -- \(String(describing: error))")
            } else {
                print("Successfully autenticated with Firebase")
            }
        })
    }

}

