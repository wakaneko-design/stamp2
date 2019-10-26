//
//  ViewController.swift
//  stamp2
//
//  Created by Yuto Wakabayashi on 2019/10/27.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageNameArray: [String] = ["hana", "hoshi", "onpu", "shitumon"]
    
    var imageIndex: Int = 0
    
    @IBOutlet var haikeiImageView: UIImageView!
    
    var ImageView: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if imageIndex != 0{
            ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            ImageView.image = image
            
            ImageView.center = CGPoint(x:location.x, y: location.y)
            
            self.view.addSubview(ImageView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hana() {
        imageIndex = 1
    }
    
    @IBAction func yuki() {
        imageIndex = 2
    }
    
    @IBAction func onpu() {
        imageIndex = 3
    }
    
    @IBAction func pc() {
        imageIndex = 4
    }
    
    @IBAction func back() {
        self.ImageView.removeFromSuperview()
    }
    @IBAction func selectBackground(){
           let imagePickerController: UIImagePickerController = UIImagePickerController()
           
           imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
           imagePickerController.delegate = self
           imagePickerController.allowsEditing = true
           
           self.present(imagePickerController, animated: true, completion: nil)
       }
       
       func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]) {
           
           let image = info[.originalImage] as? UIImage
           
           haikeiImageView.image = image
           
           self.dismiss(animated: true, completion: nil)
       }
       
       @IBAction func save(){
           let rect:CGRect = CGRect(x: 0, y: 0, width: 350, height: 400)
           UIGraphicsBeginImageContext(rect.size)
           self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
           let capture = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           
           UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
           
           
           
       }
    
    
}

