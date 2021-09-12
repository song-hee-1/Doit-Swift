//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 한송희 on 2021/08/20.
//

import UIKit
var images = ["01.png", "02.png", "03.png" , "04.png" , "05.png", "06.png"]


class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages =  images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.gray
        imgView.image = UIImage(named: images[0])
        
        // Do any additional setup after loading the view.
  
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture( _:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture( _:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named : images[pageControl.currentPage])
    }
    
    
        @objc func respondToSwipeGesture( _ gesture: UIGestureRecognizer) {
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {

                
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    if (pageControl.currentPage < pageControl.numberOfPages-1) {
                        pageControl.currentPage = pageControl.currentPage + 1
                    }
                    print("Swiped Left")
                    
                case UISwipeGestureRecognizer.Direction.right:
                    if (pageControl.currentPage>0) {
                        pageControl.currentPage = pageControl.currentPage - 1
                    }
                    print("Swiped Right")
                    
                default:
                    break
                }
                imgView.image = UIImage(named: images[pageControl.currentPage])
                
            }
        }
}
