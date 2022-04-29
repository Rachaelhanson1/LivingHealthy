//
//  SettingsViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 13/04/2022.
//

import UIKit
import Firebase
import FirebaseAuth


class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //account info
    @IBOutlet weak var updateEmailField: UITextField!
    @IBOutlet weak var updatePasswordField: UITextField!
    @IBOutlet weak var updateName: UITextField!
    
    
    
    //the three views
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var abilityView: UIView!
    

    //choosing taget goals gor goal tracker page
    @IBOutlet weak var cardioMax: UITextField!
    @IBOutlet weak var flexMax: UITextField!
    @IBOutlet weak var strengthMax: UITextField!
    @IBOutlet weak var stepsMax: UITextField!
    
    
    @IBOutlet weak var cardioL: UILabel!
    
    // ability level picker
    @IBOutlet weak var levelPicker: UIPickerView!
    var levelData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accountView.layer.cornerRadius = 10
        targetView.layer.cornerRadius = 10
        abilityView.layer.cornerRadius = 10
        
        //creating a picker for user ability level
        levelPicker.delegate = self
        levelPicker.dataSource = self
        
        levelData = ["Beginner", "Intermediate", "Advanced"]
        
        updateName.placeholder = "test"
        updateEmailField.placeholder = Auth.auth().currentUser?.email
    }
    
    //updating user weekly goals and sending results to tabbar controller to get passed to workouts VC
    @IBAction func confirm(_ sender: UIButton) {
        
        let tabbar = tabBarController as! mainTabBarViewController
        
        let cardioVal = Int(cardioMax.text!)
        tabbar.cardioValue = cardioVal!
        
        let flexVal = Int(flexMax.text!)
        tabbar.flexValue = flexVal!
        
        let strengthVal = Int(strengthMax.text!)
        tabbar.strengthValue = strengthVal!
        
        let stepVal = Int(stepsMax.text!)
        tabbar.stepsValue = stepVal!
        
        
        cardioL.text = "\(String(describing: cardioMax.text)) \(tabbar.cardioValue)"
    }
    
    
    
    //functions for the picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levelData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levelData[row]
    }
    

    //updating user details

    @IBAction func updateUserButton(_ sender: Any) {

        //update user email
        let email = updateEmailField.text!
                
        Auth.auth().currentUser?.updateEmail(to: email, completion: { (error) in
            if error == nil{
            }else{ }
        })
        //update user password
        let password = updatePasswordField.text!
                
        Auth.auth().currentUser?.updatePassword(to: password, completion: { (error) in
            if error == nil{
            }else{ }
        })

        //updates the users name on the Profile page
        fullName.firstName = updateName.text!
    }
    
    
}
    

