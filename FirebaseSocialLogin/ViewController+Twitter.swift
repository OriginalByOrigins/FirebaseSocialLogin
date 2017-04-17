//
//  ViewController+Twitter.swift
//  FirebaseSocialLogin
//
//  Created by Thai Cao Ngoc on 18/4/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import Firebase
import Fabric
import TwitterKit

extension ViewController {
    
    func addTwitterButton() {
        
        twitterButton = TWTRLogInButton(logInCompletion: { (session, error) in
            self.signIn(session: session, error: error)
        })
        
        self.view.addSubview(twitterButton)
        
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        twitterButton.topAnchor.constraint(equalTo: customGoogleButton.bottomAnchor, constant: 30).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    
    func addCustomTwitterButton() {
        self.view.addSubview(customTwitterButton)
        
        customTwitterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customTwitterButton.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 30).isActive = true
        customTwitterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        customTwitterButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        customTwitterButton.addTarget(self, action: #selector(customTTLogin), for: .touchUpInside)
    }
    
    func customTTLogin() {
        Twitter.sharedInstance().logIn { (session, error) in
            self.signIn(session: session, error: error)
        }
    }
    
    func signIn(session: TWTRSession?, error: Error?) {
        if let error = error {
            print("Failed to login to Twitter: ", error.localizedDescription)
            return
        }
        print("Successfully signed into Twiiter as ", session?.userName ?? "")
        
        guard let token = session?.authToken else { return }
        guard let secret = session?.authTokenSecret else { return }
        let credential = FIRTwitterAuthProvider.credential(withToken: token, secret: secret)
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print("Failed to login to Firebase with Twitter: ", error)
            }
            print("Successfully created a Firebase Twitter account", "\nID: ", user?.uid ?? "noID", "\nName: ", user?.displayName ?? "noName", "\nEmail: ", user?.email ?? "noEmail")
        })
    }
    
}
