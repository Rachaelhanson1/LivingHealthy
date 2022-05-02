//
//  ViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameLabel.text = fullName.firstName
        welcomeLabel.text = "Welcome \(fullName.firstName)!"
        
        welcomeView.layer.cornerRadius = 15
        
    }
}
