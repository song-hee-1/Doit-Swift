//
//  ViewController.swift
//  Audio
//
//  Created by 한송희 on 2021/08/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var slVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnPlayAudio(_ sender: UIButton) {
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
    }
    
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
    }
    
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
    }
    
    
}

