//
//  helpViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 03/05/2022.
//


import UIKit
import youtube_ios_player_helper


class helpViewController: UIViewController {

    
    @IBOutlet weak var videoTutorial: YTPlayerView!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTutorial.load(withVideoId: "oOKBRf_zu2E")

    }

}
