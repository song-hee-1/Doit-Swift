//
//  ViewController.swift
//  DrawGraphics
//
//  Created by 한송희 on 2021/08/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawFlower()
    }

    func drawFlower() {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!

        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.fillPath()
        context.strokePath()
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 120, y: 150, width: 100, height: 100))
        context.strokePath()
     
        context.addEllipse(in:CGRect(x: 170, y: 150, width: 100, height: 100))
        context.strokePath()
        
        context.addEllipse(in:CGRect(x: 70, y: 150, width: 100, height: 100))
        context.strokePath()
        
        context.addEllipse(in:CGRect(x: 120, y: 100, width: 100, height: 100))
        context.strokePath()
        
        context.addEllipse(in:CGRect(x: 120, y: 200, width: 100, height: 100))
        context.strokePath()
        

        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
        
    
    }
    
    
    

