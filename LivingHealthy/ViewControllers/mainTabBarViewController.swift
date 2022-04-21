//
//  mainTabBarViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 14/04/2022.
//

import UIKit

class mainTabBarViewController: UITabBarController {
    
    var stepValue: Int = 10000
    var waterValue: Int = 0
    var weightValue: Int = 0
    
    //to transfer the data so users can choose their target goals
    var cardioValue: Int = 50
    var flexValue: Int = 50
    var strengthValue: Int = 50
    var stepsValue: Int  = 1000
    
    var firstnameValue: String = "Lily"

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

