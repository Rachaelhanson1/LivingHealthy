//
//  GoalViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 13/04/2022.
//

import UIKit
import MBCircularProgressBar
import Firebase

class GoalViewController: UIViewController {

    
    //constraints for side menu
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    var menuOut = false
    
    
    
    // progress trackers
    //Cardio
    @IBOutlet weak var cardioProg: MBCircularProgressBarView!
    @IBOutlet weak var cardioLabel: UILabel!
    @IBOutlet weak var cardioGoal: UILabel!
    
    //flexibilty
    @IBOutlet weak var flexProg: MBCircularProgressBarView!
    @IBOutlet weak var flexLabel: UILabel!
    @IBOutlet weak var flexGoal: UILabel!
    
    //Strength
    @IBOutlet weak var strenthProg: MBCircularProgressBarView!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var strengthGoal: UILabel!
    
    //steps
    @IBOutlet weak var stepProg: MBCircularProgressBarView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var stepGoal: UILabel!
    
    
    //buttons
    @IBOutlet weak var cardMinus: UIButton!
    @IBOutlet weak var cardPlus: UIButton!
    @IBOutlet weak var flaxMinus: UIButton!
    @IBOutlet weak var flexPlus: UIButton!
    @IBOutlet weak var strenMinus: UIButton!
    @IBOutlet weak var strenPlus: UIButton!
    @IBOutlet weak var balaMinus: UIButton!
    @IBOutlet weak var balaPlus: UIButton!
    
    
    @IBOutlet weak var confirmLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardioProg.value = 0
        self.flexProg.value = 0
        self.strenthProg.value = 0
        self.stepProg.value = 0
        
        styleButtons()
        
        menuOut = false
        leading.constant = 0
        trailing.constant = 0

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        //allow the user to choose their own target goals
        let tabbar = tabBarController as! mainTabBarViewController
       
        cardioGoal.text = String(describing: tabbar.cardioValue)
        cardioProg.maxValue = CGFloat(tabbar.cardioValue)
        
        flexGoal.text = String(describing: tabbar.flexValue)
        flexProg.maxValue = CGFloat(tabbar.flexValue)
        
        strengthGoal.text = String(describing: tabbar.strengthValue)
        strenthProg.maxValue = CGFloat(tabbar.strengthValue)
        
        stepGoal.text = String(describing: tabbar.stepsValue)
        stepProg.maxValue = CGFloat(tabbar.stepsValue)
    }
    
    // function for Cardio plus and minus progress tracker and counter
    @IBAction func cardioMinus(_ sender: Any) {
        
        guard let cValue = Int(cardioLabel!.text!) else {return}
        let cardioValue = cValue - 10
        cardioLabel!.text = String(cardioValue)
        
        UIView.animate(withDuration: 1) {
            self.cardioProg.value = CGFloat(cardioValue)
        }
    }
    @IBAction func cardioPlus(_ sender: Any) {
        guard let cValue = Int(cardioLabel!.text!) else {return}
        let cardioValue = cValue + 10
        cardioLabel!.text = String(cardioValue)
        
        UIView.animate(withDuration: 1) {
            self.cardioProg.value = CGFloat(cardioValue)
        }
    }
    
    // function for felxibilty plus and minus progress tracker and counter
    @IBAction func flexMinus(_ sender: Any) {
        guard let fValue = Int(flexLabel!.text!) else {return}
        let flexValue = fValue - 10
        flexLabel!.text = String(flexValue)
        
        UIView.animate(withDuration: 1) {
            self.flexProg.value = CGFloat(flexValue)
        }
    }
    @IBAction func flexPlus(_ sender: Any) {
        guard let fValue = Int(flexLabel!.text!) else {return}
        let flexValue = fValue + 10
        flexLabel!.text = String(flexValue)
        
        UIView.animate(withDuration: 1) {
            self.flexProg.value = CGFloat(flexValue)
        }
    }
    

    // function for Strength training plus and minus progress tracker and counter
    @IBAction func strengthMinus(_ sender: Any) {
        guard let sValue = Int(strengthLabel!.text!) else {return}
        let strengthVal = sValue - 10
        strengthLabel!.text = String(strengthVal)
        
        UIView.animate(withDuration: 1) {
            self.strenthProg.value = CGFloat(strengthVal)
        }
    }
    @IBAction func strengthPlus(_ sender: Any) {
        guard let sValue = Int(strengthLabel!.text!) else {return}
        let strengthVal = sValue + 10
        strengthLabel!.text = String(strengthVal)
        
        UIView.animate(withDuration: 1) {
            self.strenthProg.value = CGFloat(strengthVal)
        }
    }
    
    // function for counting Steps, plus and minus progress tracker and counter
    @IBAction func stepMinus(_ sender: Any) {
        guard let sValue = Int(stepLabel!.text!) else {return}
        let stepValue = sValue - 10
        stepLabel!.text = String(stepValue)
        
        UIView.animate(withDuration: 1) {
            self.stepProg.value = CGFloat(stepValue)
        }
    }
    @IBAction func stepPlus(_ sender: Any) {
        guard let sValue = Int(stepLabel!.text!) else {return}
        let stepValue = sValue + 10
        stepLabel!.text = String(stepValue)
        
        UIView.animate(withDuration: 1) {
            self.stepProg.value = CGFloat(stepValue)
        }
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        confirmLabel.text = "Progress tracker has been updated!"
        
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
    
    @IBAction func menuClosed(_ sender: Any) {
        leading.constant = 0
        trailing.constant = 0
        menuOut = false
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        try? Auth.auth().signOut()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signInVC")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated:true)
    }
    
    
    
    
    func styleButtons() {
        //button styling
        cardMinus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        cardMinus.layer.shadowOffset = CGSize(width: 2, height: 2)
        cardMinus.layer.shadowRadius = 5
        cardMinus.layer.shadowOpacity = 0.8
        cardPlus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        cardPlus.layer.shadowOffset = CGSize(width: 2, height: 2)
        cardPlus.layer.shadowRadius = 5
        cardPlus.layer.shadowOpacity = 0.8
        flaxMinus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        flaxMinus.layer.shadowOffset = CGSize(width: 2, height: 2)
        flaxMinus.layer.shadowRadius = 5
        flaxMinus.layer.shadowOpacity = 0.8
        flexPlus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        flexPlus.layer.shadowOffset = CGSize(width: 2, height: 2)
        flexPlus.layer.shadowRadius = 5
        flexPlus.layer.shadowOpacity = 0.8
        strenMinus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        strenMinus.layer.shadowOffset = CGSize(width: 2, height: 2)
        strenMinus.layer.shadowRadius = 5
        strenMinus.layer.shadowOpacity = 0.8
        strenPlus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        strenPlus.layer.shadowOffset = CGSize(width: 2, height: 2)
        strenPlus.layer.shadowRadius = 5
        strenPlus.layer.shadowOpacity = 0.8
        balaMinus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        balaMinus.layer.shadowOffset = CGSize(width: 2, height: 2)
        balaMinus.layer.shadowRadius = 5
        balaMinus.layer.shadowOpacity = 0.8
        balaPlus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        balaPlus.layer.shadowOffset = CGSize(width: 2, height: 2)
        balaPlus.layer.shadowRadius = 5
        balaPlus.layer.shadowOpacity = 0.8
    }
    
}
    


