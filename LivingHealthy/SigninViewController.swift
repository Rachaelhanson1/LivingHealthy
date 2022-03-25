//
//  SigninViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 25/03/2022.
//

import UIKit
import FirebaseAuth

class SigninViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            return
        }
        
        if password.text?.isEmpty == true {
            print("No password text")
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
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homePage")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated:true)
        }
    }
}
