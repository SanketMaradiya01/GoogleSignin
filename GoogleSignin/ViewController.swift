//
//  ViewController.swift
//  GoogleSignin
//
//  Created by Nimap on 13/02/24.
//

import UIKit
import GoogleSignIn


class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

       
    @IBOutlet weak var GButton: GIDSignInButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        
        GIDSignIn.sharedInstance().uiDelegate = self
       GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
       GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
      // GIDSignIn.sharedInstance().signInSilently()
        GButton.style = GIDSignInButtonStyle.wide
        GButton.layer.borderColor = UIColor.red.cgColor
        GButton.layer.borderWidth = 1.0
        GButton.layer.cornerRadius = 5.0
        
        GIDSignIn.sharedInstance().delegate = self
    }
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        print("present")
        self.present(viewController, animated: true, completion: nil)
    }
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {
            let fullName = user.profile.name
            let email = user.profile.email
           
           
//            print("\n\(String(describing: userId)) \n\(String(describing: idToken)) \n\(String(describing: fullName)) \n \(String(describing: givenName)) \n \(String(describing: familyName)) \n \(String(describing: email))");
            
            
            DispatchQueue.main.async {
                self.defaults.setValue(email, forKeyPath: "Email")
                self.defaults.setValue(fullName, forKeyPath: "Name")

                self.defaults.synchronize()
                if let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewControllerID {
                    self.navigationController?.pushViewController(storyboard, animated: true)
                    
                } else {
                    // Handle the case where the view controller or casting fails
                    print("Error: Unable to instantiate or cast the initial view controller.")
                }
                print("Dismiss Successfully")
                
            }
            
            
        } else {
            print("\(error.localizedDescription)")
        }
        
    }
    func dataPass(name: String, email: String) {
            // Implement the delegate method to receive data from RegistrationViewControllerID
            print("ReceivedReceived data in ViewController: \(name), \(email)")
        }
}
