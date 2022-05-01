//
//  ViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameLabel.text = fullName.firstName
        welcomeLabel.text = "Welcome \(fullName.firstName)!"
        
    }
}
