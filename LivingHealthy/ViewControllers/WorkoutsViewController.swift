//
//  WorkoutsViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 12/04/2022.
//

import UIKit
import SwiftUI

class WorkoutsViewController: UIViewController {
    
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    
    @IBOutlet weak var contView: UIView!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: ListView())
               addChild(childView)
               childView.view.frame = contView.bounds
               contView.addSubview(childView.view)
               childView.didMove(toParent: self)
        
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
