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
import Fabric
import TwitterKit

class ViewController: UIViewController {
    
    let defaultFacebookButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customFacebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 56.1/255, green: 89.1/255, blue: 178.2/255, alpha: 1)
        button.setTitle("Custom Facebook Login Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5
        return button
    }()
    
    let defaultGoogleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let customGoogleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Custom Gogle Login Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5
        return button
    }()
    
    var twitterButton = TWTRLogInButton()
    
    let customTwitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 31/255, green: 151/255, blue: 255/255, alpha: 1)
        button.setTitle("Custom Twitter Login Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        addDefaultFacebookButton()
        addCustomFacebookButton()
        
        addDefaultGoogleButton()
        addCustomGoogleButton()
        
        addTwitterButton()
        addCustomTwitterButton()
    }
}



