//
//  ViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 09/03/2022.
//

import youtube_ios_player_helper
import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var player : YTPlayerView!
    
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.load(withVideoId: "bsM1qdGAVbU")
    }
    
    @IBAction func menutapped(_ sender: Any) {
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
