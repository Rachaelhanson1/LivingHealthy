//
//  WorkoutsViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 12/04/2022.
//

import UIKit
import SwiftUI

class WorkoutsViewController: UIViewController {

  
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!

    
    @IBOutlet weak var contView: UIView!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to host the UIContainerView with the SwiftUI content for filtering and sorting
        let tabbar = tabBarController as! mainTabBarViewController
      

        let beginner = tabbar.begin
        let intermediate = tabbar.inter
        let advanced = tabbar.advan
        
        //if the user chooses beginner
        if (beginner == 1) {
            let childView = UIHostingController(rootView: ListViewB())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
        }
        
        //if the user chooses intermediate
        else if (intermediate == 1){
            let childView = UIHostingController(rootView: ListViewI())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
        }
        //if the user chooses advanced
        else if (advanced == 1) {
            let childView = UIHostingController(rootView: ListViewA())
                   addChild(childView)
                   childView.view.frame = contView.bounds
                   contView.addSubview(childView.view)
                   childView.didMove(toParent: self)
        }
        //if the user doesn't choose a workout level
        else {
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
