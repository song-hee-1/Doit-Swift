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
}


class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false

    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var swIsOn: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn

    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(_controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(_controller: self, isOn: isOn)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
