//
//  SignupViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 25/03/2022.
//

import UIKit
import FirebaseAuth
import Firebase

struct fullName {
    static var firstName = ""
    static var lastName = ""
}


class SignupViewController: UIViewController {
    
    //email and password labels
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var secondPassword: UITextField!
    
    //name labels
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    // error labels
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var password2Error: UILabel!
    @IBOutlet weak var noMatch: UILabel!
    
    public var firstN = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpTapped(_ sender: Any) {

        fullName.firstName = firstName.text!
        fullName.lastName = lastName.text!
        
        if email.text?.isEmpty == true {
            print("No text in email field")
            emailError.text = "Please enter an email"
            return
        }
        if password.text?.isEmpty == true {
            print("No text in password field")
            passwordError.text = "Please enter a password"
            return
        }
        
        if secondPassword.text?.isEmpty == true {
            print("No password text")
            password2Error.text = "Please re-enter your password"
            return
        }
        
        if (password.text != secondPassword.text) {
            print("Passwords do not match")
            noMatch.text = "Your passwords do not match"
            return
        }
        
        signUp()
        
    }
    
        
    func signUp() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }

           // send the user to the welcome screen once they have signed up and clicked the 'sign up' button
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcomePage1")
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated:true)
           
        }
    }

}
