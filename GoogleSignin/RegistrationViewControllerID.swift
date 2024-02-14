//
//  RegistrationViewControllerID.swift
//  GoogleSignin
//
//  Created by Nimap on 14/02/24.
//

import UIKit
import GoogleSignIn

class RegistrationViewControllerID: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        if let nameStr = defaults.value(forKey: "Name") as? String {
           NameLabel.text = nameStr
        }
        
        if let emailStr = defaults.value(forKey: "Email") as? String {
            EmailLabel.text = emailStr
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LogOutBtnAction(_ sender: Any) {
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                
                let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
                    self.performLogout()
                }
                alert.addAction(logoutAction)
                
                present(alert, animated: true, completion: nil)
    }
    func performLogout(){
        GIDSignIn.sharedInstance().signOut()
        self.navigationController?.popViewController(animated: true)
    }
}
