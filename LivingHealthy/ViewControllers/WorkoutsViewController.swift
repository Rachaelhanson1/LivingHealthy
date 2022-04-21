//
//  WorkoutsViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 12/04/2022.
//

import UIKit
import SwiftUI

class WorkoutsViewController: UIViewController {
    
    var selectedName: String = ""
    var beginner: Int = 0
    
  
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
//    var beginner: Bool = true
//    var intermediate: Int = 0
//    var advanced: Int = 0
    
    @IBOutlet weak var contView: UIView!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //to host the UIContainerView with the SwiftUI content for filtering and sorting
        
        let tabbar = tabBarController as! mainTabBarViewController
      
        testLabel.text = tabbar.name

        
        let beginner = tabbar.name
        let intermediate = tabbar.inter
        let advanced = tabbar.advan
        

        if beginner == "yes" {
            let childView = UIHostingController(rootView: ListViewB())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
        }
        
        else if (intermediate == 1){
            let childView = UIHostingController(rootView: ListViewB())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
        }
        
        else if advanced == 1 {
            let childView = UIHostingController(rootView: ListView())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
        }
        else {
            let tabbar = mainTabBarViewController()
           // testLabel.text = tabbar.selectedName
            let childView = UIHostingController(rootView: ListView())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
            }
        
    }

   
    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            leading.constant = 150
            trailing.constant = -150
            menuOut = true
        } else  {
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
        }
    }
    

}
