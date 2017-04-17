//
//  ViewController+Google.swift
//  FirebaseSocialLogin
//
//  Created by Thai Cao Ngoc on 17/4/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

extension ViewController: GIDSignInUIDelegate {
    
    func addDefaultGoogleButton() {
        GIDSignIn.sharedInstance().uiDelegate = self
        self.view.addSubview(defaultGoogleButton)
        
        defaultGoogleButton.topAnchor.constraint(equalTo: customFacebookButton.bottomAnchor, constant: 30).isActive = true
        defaultGoogleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        defaultGoogleButton.widthAnchor.constraint(equalTo: defaultFacebookButton.widthAnchor).isActive = true
        defaultGoogleButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    func addCustomGoogleButton() {
        self.view.addSubview(customGoogleButton)
        
        customGoogleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customGoogleButton.topAnchor.constraint(equalTo: defaultGoogleButton.bottomAnchor, constant: 30).isActive = true
        customGoogleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        customGoogleButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        customGoogleButton.addTarget(self, action: #selector(customGGLogin), for: .touchUpInside)
    }
    
    func customGGLogin() {
        GIDSignIn.sharedInstance().signIn()
    }
}
