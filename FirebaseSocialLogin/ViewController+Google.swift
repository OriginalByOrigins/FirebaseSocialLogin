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
        self.view.addSubview(defaultGoogleButton)
        
        defaultGoogleButton.topAnchor.constraint(equalTo: customFacebookButton.bottomAnchor, constant: 30).isActive = true
        defaultGoogleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        defaultGoogleButton.widthAnchor.constraint(equalTo: defaultFacebookButton.widthAnchor).isActive = true
        defaultGoogleButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
}
