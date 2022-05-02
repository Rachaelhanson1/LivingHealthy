//
//  SigninViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 25/03/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SigninViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //all of the possible errors when creating an account
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var signInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        signButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        signButton.layer.shadowRadius = 10
        signButton.layer.shadowOpacity = 1
        
        signInView.layer.cornerRadius = 15
        signInView.layer.shadowColor = UIColor.lightGray.cgColor
        signInView.layer.shadowOffset = CGSize(width: 1, height: 2)
        signInView.layer.shadowRadius = 10
        signInView.layer.shadowOpacity = 1

    }

    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
}
    
    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    
    
    
    
    func validateFields() {
        if email.text?.isEmpty == true {
            print("No email text")
            emailError.text = "Please enter an email"
            return
        }
        
        if password.text?.isEmpty == true {
            print("No password text")
            passwordError.text = "Please enter a password"
            return
        }

            
        signIn()
    }

    func signIn() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    

    // automatically log the user in, if they have been previously logged in on this device and if they have not logged out
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "tabBarController")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated:true)
        }
    }
}
