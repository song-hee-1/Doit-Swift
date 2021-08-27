//
//  ViewController.swift
//  WebMission
//
//  Created by 한송희 on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {
    
    func loadWebPage(_ url: String) {
       let myUrl = URL(string: url)
       let myRequest = URLRequest(url: myUrl!)
       myWebView.load(myRequest)
   }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

