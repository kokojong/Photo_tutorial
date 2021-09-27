//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by kokojong on 2021/09/27.
//

import UIKit
import YPImagePicker


class ViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChangeButton.layer.cornerRadius = 10
        
        self.profileChangeButton.addTarget(self, action: #selector(onProfileChangeButtonClicked), for: .touchUpInside)
        
        
    }

    @objc fileprivate func onProfileChangeButtonClicked(){
        print("onProfileChangeButtonClicked")
        
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo, .video]
        
        
        let picker = YPImagePicker(configuration: config)
        
        // 사진이 선택되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                // 프사 변경
                self.profileImage.image = photo.image
            }
            // 사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        // 사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
        
    }
    
}

