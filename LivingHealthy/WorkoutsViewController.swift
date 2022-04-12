//
//  WorkoutsViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 12/04/2022.
//

import UIKit
import SwiftUI

class WorkoutsViewController: UIViewController {
    
    
    @IBOutlet weak var contView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: ListView())
               addChild(childView)
               childView.view.frame = contView.bounds
               contView.addSubview(childView.view)
               childView.didMove(toParent: self)
        
    }


}
