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
    
    // labels for username
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    //picker
    @IBOutlet weak var levelPicker: UIPickerView!
    var levelData: [String] = [String]()
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // NotificationCenter.default.addObserver(self, selector: #selector(didGetName(_:)), name: Notification.Name("text"), object: nil)
        
        
        //creating a picker for user ability level
        
        levelPicker.delegate = self
        levelPicker.dataSource = self
        
        levelData = ["Beginner", "Intermediate", "Advanced"]

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
    
    
    @IBAction func didTapButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "other") as! SignupViewController
        vc.fnSent = { text in
            self.firstName.text = text
        }
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
