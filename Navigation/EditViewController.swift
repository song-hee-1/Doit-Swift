//
//  EditViewController.swift
//  Navigation
//
//  Created by 한송희 on 2021/08/04.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_controller: EditViewController, message:String)
    func didImageOnOffDone(_controller: EditViewController, isOn:Bool)
    func didImageZoomDone(_controller: EditViewController, isZoom:Bool)
}


class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false

    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var btnResize: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom {
            btnResize.setTitle("확대", for: UIControl.State())
        } else {
            btnResize.setTitle("축소", for: UIControl.State())
        }
    }

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(_controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(_controller:  self, isOn: isOn)
            delegate?.didImageZoomDone(_controller: self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            btnResize.setTitle("축소", for: UIControl.State())
        } else {
            isZoom = true
            btnResize.setTitle("확대", for: UIControl.State())
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */

}
