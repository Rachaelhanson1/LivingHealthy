//
//  ProfileViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 28/03/2022.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //constraints for side menu
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    var menuOut = false
    @IBOutlet weak var seperators: UIView!
    @IBOutlet weak var separator2: UIView!
    @IBOutlet weak var separator3: UIView!
    
    
    // labels for username
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    // ability level picker
    @IBOutlet weak var levelPicker: UIPickerView!
    var levelData: [String] = [String]()
    
    //steppers
    
    @IBOutlet weak var stepperStepper: UIStepper!
    @IBOutlet weak var waterButton: UIStepper!
    @IBOutlet weak var weightButton: UIStepper!
    
    // steppers labels
    @IBOutlet weak var totStepLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    
    
    
    @IBOutlet weak var abilityView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating a picker for user ability level
        
        levelPicker.delegate = self
        levelPicker.dataSource = self
        
        levelData = ["Beginner", "Intermediate", "Advanced"]
        
        let tabbar = tabBarController as! mainTabBarViewController
        totStepLabel.text = String(describing: tabbar.stepValue)
        
        
        let SIvc = SignupViewController()
        firstName.text = "\(SIvc.firstname)"
        
        seperators.layer.cornerRadius = 10
        abilityView.layer.cornerRadius = 10
        
        // number of steps with incremental stepper
        totStepLabel.text = "2000"
        stepperStepper.stepValue = 500
        stepperStepper.maximumValue = 20000
        weightButton.minimumValue = 0
        
            
        // number for weight with incremental stepper
        weightLabel.text = "50"
        weightButton.value = 50
        weightButton.stepValue = 2
        weightButton.maximumValue = 100
        weightButton.minimumValue = 0
      
        // number for water of glasses drank with incremental stepper
        waterLabel.text = "1"
        waterButton.stepValue = 1
        waterButton.maximumValue = 15
        weightButton.minimumValue = 0
        

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levelData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levelData[row]
    }
    
    // trying to get data from sign up view controller**********
    @IBAction func didTapButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "other") as! SignupViewController
        vc.fnSent = { text in
            self.firstName.text = text
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        totStepLabel.text = String(describing: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let tabbar = tabBarController as! mainTabBarViewController
        tabbar.stepValue = Int(totStepLabel.text!)!
    }
    
    @IBAction func stepStepper(_ sender: UIStepper) {
        totStepLabel.text = Int(sender.value).description
    }
    
    @IBAction func weightStepper(_ sender: UIStepper) {
        weightLabel.text = Int(sender.value).description

    }
    
    @IBAction func waterStepper(_ sender: UIStepper) {
        waterLabel.text = Int(sender.value).description

    }
    
    
    
    //move view to the side for the side menu to come out
    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            leading.constant = 150
            trailing.constant = -150
            menuOut = true
        } else  {
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
        }
        
    }
    
//    @objc func didGetName( _ notification: Notification) {
//        let text = notification.object as! String?
//        firstName.text = text
//    }
 

}
