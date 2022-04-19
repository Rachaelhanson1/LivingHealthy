//
//  AllWorkoutsViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 29/03/2022.
//

import youtube_ios_player_helper
import UIKit

class AllWorkoutsViewController: UIViewController {
    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    var menuOut = false

    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: "okxbGxbj03s")
     
        favourite()
        
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
    

    func favourite() {
            let star = UIImage(systemName: "star")
            let starFilled = UIImage(systemName: "star.fill")
            starButton.setImage(star, for: .normal)
            starButton.setImage(starFilled, for: .selected)
    }
    
    @IBAction func starPressed(_ sender: Any) {
        starButton.isSelected.toggle()
    }
}
    



// if empty star is pressed, convert star to a filled star      ----DONE
// if filled star is pressed, convert star to empty star        ----DONE

// if star is pressed, add video to favoruites page at position 'positon filled'
//position filled = 0
//PF + 1 each time star is clicked
