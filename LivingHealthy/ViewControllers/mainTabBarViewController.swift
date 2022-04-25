//
//  mainTabBarViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 14/04/2022.
//

import UIKit

class mainTabBarViewController: UITabBarController {
    

    //to transfer the data so users can choose their target goals
    var cardioValue: Int = 50
    var flexValue: Int = 50
    var strengthValue: Int = 50
    var stepsValue: Int  = 50
    
    var firstnameValue: String = ""
    
    //to transfer data from the Welcome VC to All Workouts VC
    var begin: Int?
    var inter: Int?
    var advan: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 1
        
    }
}

