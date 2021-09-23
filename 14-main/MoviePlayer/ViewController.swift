//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 한송희 on 2021/08/12.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // 내부 파일 mp4 , 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        playVideo(url: url) // 앞에서 얻은 url를 사용하여 비디오를 재생
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        // 외부 파일 mp4, 외부에 링크된 주소를 NSURL 형식으로 변경
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        
        playVideo(url: url) // 앞에서 얻은 url를 사용하여 비디오를 재생
        
    }
    
    private func playVideo(url: NSURL) {
        // AVPlyaerViewController의 인스턴스를 생성
        let playerControllr = AVPlayerViewController()
        // 비디오 URL로 초기화된 AVPlayer의 인스턴스를 생성
        let player = AVPlayer(url: url as URL)
        // AVPlayerViewController의 player 속성에 위에서 생성한 AVPlayer 인스턴스를 할당
        playerControllr.player = player
        
        self.present(playerControllr, animated: true) {
            player.play() // 비디오 재생
        }
    }
    
}

