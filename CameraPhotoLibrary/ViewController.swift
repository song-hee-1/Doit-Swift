//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 한송희 on 2021/08/13.
//

import UIKit
import MobileCoreServices // 다양한 타입들을 정의해 놓은 헤더 파일 추가

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate { // 델리게이터 프로토콜 추가
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    

    // UIImagePickerController 인스턴스 변수 생성
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage! // 사진을 저장할 변수
    var videoURL: URL! // 녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = false // 사진 저장 여부를 나타낼 변수
    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // 사진 촬영하기
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        // 만일 카메라를 사용할 수 있다면
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            numImage = numImage + 1
            if numImage>3 { numImage = 1 }
            
            flagImageSave = true // 사진 저장 플래그를 true로 설정
            
            imagePicker.delegate = self // 이미지 피커의 델리게이트를 self로 설정
            imagePicker.sourceType = .camera // 이미지 피커의 소스타입을 Camera로 설정
            imagePicker.mediaTypes = [kUTTypeImage as String] // 미디어 타입을 KUTTypeImage로 설정
            imagePicker.allowsEditing = false // 편집을 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil) // 뷰 컨트롤러를 ImagePicker로 대체
        } else { // 카메라를 사용할 수 없을 때 경고창 출력
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    // 사진 불러오기
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            numImage = numImage + 1
            if numImage>3 { numImage = 1 }
            flagImageSave = false
            
            imagePicker.delegate = self
            // 이미지 피커의 소스 타입을 photoLibrary로 설정
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true // 편집을 허용
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
  
    @IBAction func btnReset(_ sender: UIButton) {
            numImage = 0
            imgView1 = nil
            imgView2 = nil
            imgView3 = nil
    }
    
    
    // 사진,비디오 촬영이나 선택이 끝났을 때 호출되는 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
   
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            // 사진을 가져옴
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave { //flagImageSave가 true일 때
                // 사진을 포토라이브러리에 저장
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            if numImage==1 { imgView1.image = captureImage }
            else if numImage==2 { imgView2.image = captureImage }
            else if numImage==3 { imgView3.image = captureImage }
                // 가져온 사진을 이미지뷰에 출력
        }
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String) { //미디어가 비디오일 때
                if flagImageSave { // flagImageSave가 true일 떄
                    // 비디오를 가져옴
                    videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                    // 비디오를 포토 라이브러리에 저장
                    UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, Self.self, nil, nil)
                }
        }
        
        self.dismiss(animated: true, completion:nil)
}

    // 사진,비디오 촬영이나 선택을 취소했을 때 호출되는 델리게이트 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //현재의 뷰(이미지피커)제거
          numImage = numImage - 1
          if numImage<0 { numImage = 0 }
        self.dismiss(animated: true, completion:nil)
    }
        
    // 경고 창 출력 함수
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
