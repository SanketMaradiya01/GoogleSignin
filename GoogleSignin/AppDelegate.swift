//
//  AppDelegate.swift
//  GoogleSignin
//
//  Created by Nimap on 13/02/24.
//

import UIKit
import GoogleSignIn
import CoreData
import GGLSignIn
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//         // Override point for customization after application launch.
        
        // Initialize sign-in

        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
//        GIDSignIn.sharedInstance().delegate = self
       
            return true
    }

//    func application(_ application: UIApplication,
//                         open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//            var handled: Bool
//
//            handled = GIDSignIn.sharedInstance.handle(url)
//            if handled {
//              return true
//            }
//            
//            return false
//        }
//    
//    func application(_ app: UIApplication, open url: URL,
//                         options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//            var handled: Bool
//            handled = GIDSignIn.sharedInstance.handle(url)
//            
//            if handled {
//              return true
//            }
//            // Handle other custom URL types.
//            // If not handled by this app, return false.
//            return false
//        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        let isFacebookURL = FBSDKApplicationDelegate.sharedInstance().application(application,
//                                                                                  open: url,
//                                                                                  sourceApplication: sourceApplication,
//                                                                                  annotation: annotation)
        
        let isGooglePlusURL = GIDSignIn.sharedInstance().handle(url,
                                                                sourceApplication: sourceApplication,
                                                                annotation: annotation)
        
     //   return isFacebookURL || isGooglePlusURL
        return isGooglePlusURL
    }
    
    
    
//    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let fullName = user.profile.name
//            let givenName = user.profile.givenName
//            let familyName = user.profile.familyName
//            let email = user.profile.email
//           
//           
//            print("\n\(String(describing: userId)) \n\(String(describing: idToken)) \n\(String(describing: fullName)) \n \(String(describing: givenName)) \n \(String(describing: familyName)) \n \(String(describing: email))");
//            
//            if (user.profile.hasImage) {
//                let url = user.profile.imageURL(withDimension: 100)
//               
//                print("url....\(String(describing: url))")
//        
//                self.defaults.set(url, forKey: "user_photo")
//            }
//            
//            DispatchQueue.main.async { () -> Void in
//                
//                self.defaults.setValue(email, forKeyPath: "gemail")
//                self.defaults.setValue(fullName, forKeyPath: "gfullName")
//
//                self.defaults.synchronize()
//                if let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewControllerID") as? RegistrationViewControllerID {
//                    self.window?.rootViewController = storyboard
//                    self.window?.makeKeyAndVisible()
//                } else {
//                    // Handle the case where the view controller or casting fails
//                    print("Error: Unable to instantiate or cast the initial view controller.")
//                }
//                print("Dismiss Successfully")
//                
//            }
//            
//            
//        } else {
//            print("\(error.localizedDescription)")
//        }
//        
//    }
}

