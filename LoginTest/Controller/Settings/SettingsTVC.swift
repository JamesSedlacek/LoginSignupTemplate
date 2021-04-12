//
//  SettingsTVC.swift
//  LoginTest
//
//  Created by James Sedlacek on 3/11/21.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

enum SectionNumber: Int {
    case notifications = 0
    case contactus = 1
    case legal = 2
    case account = 3
}

class SettingsTVC: UITableViewController {
    
    // MARK: - Variables
    
    
    // MARK: - IBOutlets
    
    
    // MARK: - IBActions
    
    func signout() {
        AlertService.logout(viewController: self, completed: {
            do {
                if K.Enums.loggedInUsing == .Facebook {
                    LoginManager().logOut()
//                    print("Logged out of Facebook")
                } else if K.Enums.loggedInUsing == .Google {
                    GIDSignIn.sharedInstance()?.signOut()
//                    print("Signed out of Google")
                }
                
                try Auth.auth().signOut()
//                print("Signed out of Firebase")
                
                self.performSegue(withIdentifier: K.Strings.logoutIdentifier, sender: nil)
            } catch {
//                print("Error: \(error)")
                AlertService.showPopup(title: "Error logging out!", message: "Try again.", viewController: self)
            }
        })
    }
    
    func deleteAccount() {
        AlertService.deleteAccount(viewController: self, completed: {
            Auth.auth().currentUser?.delete(completion: {_ in
                self.performSegue(withIdentifier: K.Strings.logoutIdentifier, sender: nil)
            })
        })
    }
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }

//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let shadowView = UIView()
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowRadius = 3.0
//        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        shadowView.layer.shadowOpacity = 0.5
//        shadowView.layer.masksToBounds = false
//        return shadowView
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let shadowView = UIView()
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowRadius = 3.0
//        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        shadowView.layer.shadowOpacity = 0.5
//        shadowView.layer.masksToBounds = false
//        return shadowView
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == SectionNumber.account.rawValue {
            if indexPath.row == 2 { //Sign Out
                signout()
            } else if indexPath.row == 3 {
                deleteAccount()
            }
        }
    }
}
