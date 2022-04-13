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
    
    //water tracker
    @IBOutlet weak var noWaterLabel: UILabel!
    @IBOutlet weak var waterTracker: UIProgressView!
    
    //weight tracker
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //step increase button
    @IBAction func stepPlus(_ sender: UIButton) {
        let i = stepTracker.progress
        stepTracker.progress += Float(0.1)
        let x = Int(i*10000)
        noStepLabel.text = "\(x)/10,000"
    }
    //step decrease button
    @IBAction func stepMinus(_ sender: UIButton) {
        
        let i = stepTracker.progress
        stepTracker.progress -= Float(0.1)
        let x = Int(i*10000)
        noStepLabel.text = "\(x)/10,000"
        }
    
    //water increase button
    @IBAction func waterPlus(_ sender: UIButton) {
        let i = stepTracker.progress
        stepTracker.progress += Float(0.1)
        let x = Int(i*10000)
        noStepLabel.text = "\(x)/10,000"
    }
    //water decrease button
    @IBAction func waterMinus(_ sender: UIButton) {
        let i = stepTracker.progress
        stepTracker.progress -= Float(0.1)
        let x = Int(i*10000)
        noStepLabel.text = "\(x)/10,000"
    }
    
    
    
    
    
    
    
    }
    


