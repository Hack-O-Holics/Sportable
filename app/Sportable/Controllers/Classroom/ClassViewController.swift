//
//  ClassViewController.swift
//  Sportable
//
//  Created by Shreeniket Bendre on 8/22/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit
import SafariServices
import AVKit
import MobileCoreServices
import Photos

class ClassViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   @IBAction func tappedPortal(_ sender: Any){
    let url = URL(string: "https://johnnyni2961.github.io/Hackathon-Login-Screen/")!
        let vc = SFSafariViewController(url: url)
        present (vc, animated: true)
        
    }
    
    @IBOutlet weak var RecordButton: UIButton!
      var videoAndImageReview = UIImagePickerController()
      var videoURL: URL?


      @IBAction func RecordAction(_ sender: UIButton) {
          
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
              print("Camera Available")
              
              let imagePicker = UIImagePickerController()
              imagePicker.delegate = self
              imagePicker.sourceType = .camera
              imagePicker.mediaTypes = [kUTTypeMovie as String]
              imagePicker.allowsEditing = true
              
              self.present(imagePicker, animated: true, completion: nil)
          } else {
              print("Camera UnAvaialable")
          }
          
      }
      
    private func imagePickerController(_ picker: UIImagePickerController,
                                 didFinishPickingMediaWithInfo info: [String : Any]) {
          dismiss(animated: true, completion: nil)
          
          guard
            let mediaType = info[UIImagePickerController.InfoKey.mediaType.rawValue] as? String,
              mediaType == (kUTTypeMovie as String),
            let url = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL,
              UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
              else {
                  return
            }
            saveVideoToAlbum(url, nil)
          
          // Handle a movie capture
          UISaveVideoAtPathToSavedPhotosAlbum(
              url.path,
              self,
              #selector(video(_:didFinishSavingWithError:contextInfo:)),
              nil)
      }
      
      @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
          let title = (error == nil) ? "Success" : "Error"
          let message = (error == nil) ? "Video was saved" : "Video failed to save"
          
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
          present(alert, animated: true, completion: nil)
      }
    
      @IBAction func openImgVideoPicker() {
          videoAndImageReview.sourceType = .savedPhotosAlbum
          videoAndImageReview.delegate = self
          videoAndImageReview.mediaTypes = ["public.movie"]
          present(videoAndImageReview, animated: true, completion: nil)
      }
      
      func videoAndImageReview(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        videoURL = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL
        
        saveVideoToAlbum(videoURL!) { (error) in
            print("error at 98")
        }
          print("videoURL:\(String(describing: videoURL))")
          self.dismiss(animated: true, completion: nil)
      }
    func saveVideoToAlbum(_ outputURL: URL, _ completion: ((Error?) -> Void)?) {
        requestAuthorization {
            PHPhotoLibrary.shared().performChanges({
                let request = PHAssetCreationRequest.forAsset()
                request.addResource(with: .video, fileURL: outputURL, options: nil)
            }) { (result, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Saved successfully")
                    }
                    completion?(error)
                }
            }
        }
    }
    func requestAuthorization(completion: @escaping ()->Void) {
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async {
                    completion()
                }
            }
        } else if PHPhotoLibrary.authorizationStatus() == .authorized{
            completion()
        }
    }


}
