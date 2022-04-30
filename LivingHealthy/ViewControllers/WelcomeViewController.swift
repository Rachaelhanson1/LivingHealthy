//
//  WelcomeViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 20/04/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    //buttons
    @IBOutlet weak var begButton: UIButton!
    @IBOutlet weak var interButton: UIButton!
    @IBOutlet weak var advanButton: UIButton!
    
    
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var beginV: Int = 1
    var interV: Int = 1
    var advanV: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(fullName.firstName)"

        //button shadows
        begButton.layer.shadowColor = UIColor.black.cgColor
        begButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        begButton.layer.shadowRadius = 5
        begButton.layer.shadowOpacity = 1.0
        interButton.layer.shadowColor = UIColor.black.cgColor
        interButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        interButton.layer.shadowRadius = 5
        interButton.layer.shadowOpacity = 1.0
        advanButton.layer.shadowColor = UIColor.black.cgColor
        advanButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        advanButton.layer.shadowRadius = 5
        advanButton.layer.shadowOpacity = 1.0
    }


    
    @IBAction func beginnerPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "begToTab", sender: self)
        }
    
    @IBAction func intermediatePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "intToTab", sender: self)
        }
    @IBAction func advancedPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "adToTab", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "begToTab"){
           
            let tabbar = segue.destination as! mainTabBarViewController

            tabbar.begin = beginV
            }
        
        if(segue.identifier == "intToTab"){
            
            let tabbar = segue.destination as! mainTabBarViewController
            tabbar.inter = interV
        }
        if(segue.identifier == "adToTab"){
            let tabbar = segue.destination as! mainTabBarViewController
            tabbar.advan = advanV
            
        }
    }
    
}
