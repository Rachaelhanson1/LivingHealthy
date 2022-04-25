//
//  WelcomeViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 20/04/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

        
    @IBOutlet weak var nameTest: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var beginV: Int = 1
    var interV: Int = 1
    var advanV: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTest.text = fullName.firstName

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
