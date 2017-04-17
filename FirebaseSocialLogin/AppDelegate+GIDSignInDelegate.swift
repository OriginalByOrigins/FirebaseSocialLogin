//
//  AppDelegate+GIDSignInDelegate.swift
//  FirebaseSocialLogin
//
//  Created by Thai Cao Ngoc on 17/4/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

extension AppDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Failed to sign in with Google: ", error)
            return
        }
        print("Succesfully log in with Google", user ?? "")
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print("Failed to sign in Firebase: ", error)
                return
            }
            
            print("Successfully sign in Firebase: ", user ?? "")
        })
    }
}
