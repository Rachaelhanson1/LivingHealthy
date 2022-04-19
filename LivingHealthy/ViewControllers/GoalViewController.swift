//
//  GoalViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 13/04/2022.
//

import UIKit

class GoalViewController: UIViewController {

    //step tracker
    @IBOutlet weak var stepTracker: UIProgressView!
    @IBOutlet weak var noStepLabel: UILabel!
    @IBOutlet weak var totStepLabel: UILabel!
    
    
    //water tracker
    @IBOutlet weak var noWaterLabel: UILabel!
    @IBOutlet weak var waterTracker: UIProgressView!
    
    //weight tracker
    
    //label for goal met
    @IBOutlet weak var goalMetLabel: UILabel!
    
    // minutes completed within the app progress bar
    @IBOutlet weak var weekGoalBar: UIProgressView!
    
    // minutes completed externally to the app progress bar
    @IBOutlet weak var outOfAppBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController as! mainTabBarViewController
        totStepLabel.text = String(describing: tabbar.stepValue)
        progressBarResize()
        
    }
    
    //resize and position the progress bars to be vertical
    func progressBarResize() {
        weekGoalBar.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        weekGoalBar.transform = weekGoalBar.transform.scaledBy(x: 1.2, y: 6)
       
       
        outOfAppBar.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        outOfAppBar.transform = outOfAppBar.transform.scaledBy(x: 1.2, y: 6)
        
    }
    
    //step increase button
    @IBAction func stepPlus(_ sender: UIButton) {
        let i = stepTracker.progress
        stepTracker.progress += Float(0.1)
        let x = Int(i*10000) //this number
        noStepLabel.text = "\(x)/10000" //this number neeed to be the same
    }
    //step decrease button
    @IBAction func stepMinus(_ sender: UIButton){
        
        let i = stepTracker.progress
        stepTracker.progress -= Float(0.1)
        let x = Int(i*10000)
        noStepLabel.text = "\(x)/10000"
        }
    
    
    //water increase button
    @IBAction func waterPlus(_ sender: UIButton) {
        let i = stepTracker.progress
        waterTracker.progress += Float(0.125)
        let x = Int(i*10)
        noWaterLabel.text = "\(x)/8"
    }
    //water decrease button
    @IBAction func waterMinus(_ sender: UIButton) {
        let i = stepTracker.progress
        waterTracker.progress -= Float(0.125)
        let x = Int(i*10)
        noWaterLabel.text = "\(x)/8"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! mainTabBarViewController
        totStepLabel.text = String(describing: tabbar.stepValue)
        
    }
    
    
    
    // if progress goal bar == 1 then change goalMetLabel to "Goal Met!"
    
    
    }
    


