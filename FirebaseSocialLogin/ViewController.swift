//
//  ViewController.swift
//  FirebaseSocialLogin
//
//  Created by Thai Cao Ngoc on 17/4/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class ViewController: UIViewController {
    
    let defaultFacebookButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customFacebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Custom Facebook Login Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let defaultGoogleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        addDefaultFacebookButton()
        addCustomFacebookButton()
        
        addDefaultGoogleButton()
    }
}



