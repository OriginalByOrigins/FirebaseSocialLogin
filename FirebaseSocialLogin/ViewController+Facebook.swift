//
//  ViewController+Facebook.swift
//  FirebaseSocialLogin
//
//  Created by Thai Cao Ngoc on 17/4/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

extension ViewController: FBSDKLoginButtonDelegate {
    func addDefaultFacebookButton() {
        self.view.addSubview(defaultFacebookButton)
        defaultFacebookButton.delegate = self
        defaultFacebookButton.readPermissions = ["email", "public_profile",]
        
        defaultFacebookButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        defaultFacebookButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        defaultFacebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        defaultFacebookButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    /**
     Sent to the delegate when the button was used to login.
     - Parameter loginButton: the sender
     - Parameter result: The results of the login
     - Parameter error: The error (if any) from the login
     */
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print("Error loging in\n", error)
            return
        }
        print("Sucessfully log in to Facebook")
        signInFirebase()
        triggerGraphRequest()
    }
    
    
    /**
     Sent to the delegate when the button was used to logout.
     - Parameter loginButton: The button that was clicked.
     */
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Loged out of Facebook")
    }
    
    func triggerGraphRequest() {
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "name, id, email"]).start { (connection, result, error) in
            if error != nil {
                print("Error request graph\n", error ?? "")
            }
            print("Graph Request Successfully", result ?? "Seccesfully log in")
        }
    }
    
    func signInFirebase() {
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                print("Failed to sign in to Firebase\n", error ?? "")
                return
            }
            print("Successfully sign in to Firebse\n", user ?? "")
        })
    }
    
}

extension ViewController {
    func addCustomFacebookButton() {
        self.view.addSubview(customFacebookButton)
        
        customFacebookButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customFacebookButton.topAnchor.constraint(equalTo: defaultFacebookButton.bottomAnchor, constant: 30).isActive = true
        customFacebookButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        customFacebookButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        customFacebookButton.addTarget(self, action: #selector(customFBLogin), for: .touchUpInside)
    }
    
    func customFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, error) in
            if error != nil {
                print("Error loging in\n", error ?? "")
                return
            }
            
            self.signInFirebase()
            self.triggerGraphRequest()
        }
    }
}
