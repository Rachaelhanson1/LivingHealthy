//
//  GoalViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 13/04/2022.
//

import UIKit
import MBCircularProgressBar

class GoalViewController: UIViewController {

    
    
    
    @IBOutlet weak var testtest: UILabel!
    
    // progress trackers
    //Cardio
    @IBOutlet weak var cardioProg: MBCircularProgressBarView!
    @IBOutlet weak var cardioLabel: UILabel!
    
    //flexibilty
    @IBOutlet weak var flexProg: MBCircularProgressBarView!
    @IBOutlet weak var flexLabel: UILabel!
    
    //Strength
    @IBOutlet weak var strenthProg: MBCircularProgressBarView!
    @IBOutlet weak var strengthLabel: UILabel!
    
    //steps
    @IBOutlet weak var stepProg: MBCircularProgressBarView!
    @IBOutlet weak var stepLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardioProg.value = 0
        self.flexProg.value = 0
        self.strenthProg.value = 0
        self.stepProg.value = 0
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //allow user to choose what their target goal is
        let tabbar = tabBarController as! mainTabBarViewController
        testtest.text = String(describing: tabbar.cardioValue)
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
    
    
    
    
    
//    override func viewDidAppear(_ animated: Bool) {
  //      let tabbar = tabBarController as! mainTabBarViewController
//        totStepLabel.text = String(describing: tabbar.stepValue)

  //  }
    
    
    
    // if progress goal bar == 1 then change goalMetLabel to "Goal Met!"
    
    
    }
    


