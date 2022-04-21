//
//  WelcomeViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 20/04/2022.
//

import UIKit

struct begButton {
    
    static var beginnerButton = 0
}

struct interButton {
    
    static var intermediateButton = 0
}

struct advanButton {
    static var advancedButton = 0
}

public var adButton = 0

class WelcomeViewController: UIViewController {

    @IBOutlet weak var beginnerButton: UIButton!
    @IBOutlet weak var intermediateButton: UIButton!
    @IBOutlet weak var advancedButton: UIButton!
    
//    public var beginnerbutton: Int = 0
//    public var intermediatebutton = 0
    public var advancedbutton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func begButtonSelected(_ sender: Any) {
       // beginnerbutton = 1
        begButton.beginnerButton = 1
    }
    
    


}


