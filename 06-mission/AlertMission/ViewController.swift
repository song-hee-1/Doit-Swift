//
//  ViewController.swift
//  AlertMission
//
//  Created by 한송희 on 2021/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)    //타이머가 구동되면 실행할 함수
    let interval = 1.0 //타이머 간격 1초
    var count = 0 //타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    var alarmTime = "" // var alarmTime = string?
    var alertFlag = false

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) //타이머 설정

    }

    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender //전달된 인수 저장
                
                let formatter = DateFormatter() //DateFormatter 클래스 상수 선언
                formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" //Formatter의 dateFormat 속성을 설정
                lblPickerTime.text = "선택시간: " + formatter.string(from:datePickerView.date)
                //데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(string)로 변환
                
                formatter.dateFormat = "hh:mm aaa"
                alarmTime = formatter.string(from: datePickerView.date)
        
    }
    
    //타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func updateTime() {

        // lblCurrentTime.text = String(count)
        //count값을 문자열로 변환하여 lblCurrentTime.text에 출력
        //count = count + 1
            
        let date = NSDate() // 현재 시간을 가져옴
            
        let formatter = DateFormatter() //DateFormatter라는 클래스의 상수 formatter을 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // 상수 formatter의 dateformat 속성을 설정
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
            // 현재 날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(string)으로 변환
            // 문자열로 반환한 date 값을 "현재시간: "이라는 문자열에 추가하고 그 문자열을 lblCurrentTime의 text에 추가
            
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(for: date)
        if(alarmTime == currentTime) {
            if alertFlag == false {
                let TimeOnAlert = UIAlertController(title: "알람", message: "설정된 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "네,알겠습니다", style: UIAlertAction.Style.default, handler: nil)
                TimeOnAlert.addAction(onAction)
                present(TimeOnAlert, animated: true, completion: nil)
                alertFlag = true
                }
            } else {
                alertFlag = false
            }
        }
}
