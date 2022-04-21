//
//  WelcomeViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 20/04/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var beginnerButton: UIButton!
        
    @IBOutlet weak var testNumber: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    var beginV: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    @IBAction func beginnerPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "welToTab", sender: self)
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "welToTab"){
                    let displayVC = segue.destination as! mainTabBarViewController
                    displayVC.name = nameTextField.text
            }
        }
        
        
        
        
//        let workView = self.tabBarController!.viewControllers![2] as! UINavigationController
//        let vc = workView.topViewController as! WorkoutsViewController
//        vc.beginner = beginV
        
        
//
//        let tabbar = mainTabBarViewController()
//        tabbar.begin = beginV
//        testNumber.text = "value: \(tabbar.begin)"
        
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
//        vc?.modalPresentationStyle = .overFullScreen
//        self.present(vc!, animated:true)
    
    
    @IBAction func intermediatePressed(_ sender: Any) {
        
//        beginV = 1
//        performSegue(withIdentifier: "interSegue", sender: beginV)
//
        
//        let tabbar = tabBarController as? mainTabBarViewController
//        tabbar?.inter = 1
//
//        let viewControllerWork =  mainTabBarViewController()
//        viewControllerWork.selectedName = name;
//
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
//        vc?.modalPresentationStyle = .overFullScreen
//        self.present(vc!, animated:true)

    }

    
    @IBAction func advancedPressed(_ sender: Any) {
//        let tabbar = tabBarController as? mainTabBarViewController
//        tabbar?.advan = 1
//
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
//        vc?.modalPresentationStyle = .overFullScreen
//        self.present(vc!, animated:true)
//
//
        
        
    }

}
