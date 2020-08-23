//
//  VidViewController.swift
//  Sportable
//
//  Created by Shreeniket Bendre on 8/22/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices
import Alamofire

class VidViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
                
        cell.lbl.tag = indexPath.row
        //        cell.buttonMain.frame.size.height = vie
        //        cell.buttonMain.frame.size.width = view.frame.width
        //
                
        cell.lbl.text = "Assignment: Pushups (Code: \(cell.lbl.tag + 1871)) "
        //cell.buttonMain.setBackgroundImage(image, for: .normal)
                
                return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0
        height = view.frame.width-85
        return 40
    }
    
    
    

    @IBOutlet weak var imgView: UIImageView!
    var imagePickerController = UIImagePickerController()
    var videoURL : NSURL?

    @IBAction func btnSelectVideo_Action(_ sender: Any) {
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = [kUTTypeMovie as String]
        imagePickerController.videoQuality = .typeLow
        imagePickerController.videoExportPreset = AVAssetExportPresetPassthrough
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        videoURL = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.mediaURL.rawValue)]as? NSURL
            print(videoURL!)
//        let url: URL = URL(fileURLWithPath: "\(videoURL!)")
        uploadVideo(videoUrl: videoURL!)
            do {
                let asset = AVURLAsset(url: videoURL! as URL , options: nil)
                let imgGenerator = AVAssetImageGenerator(asset: asset)
                imgGenerator.appliesPreferredTrackTransform = true
                let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
                let thumbnail = UIImage(cgImage: cgImage)
                imgView.image = thumbnail
            } catch let error {
                print("*** Error generating thumbnail: \(error.localizedDescription)")
            }
            self.dismiss(animated: true, completion: nil)
        }
    
        func uploadVideo(videoUrl: NSURL) { // local video file path..
            let timestamp = NSDate().timeIntervalSince1970 // just for some random name.
            
            AF.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(videoUrl as URL, withName: "picture", fileName: "\(timestamp).MOV", mimeType: "\(timestamp)/mov")
            }, to: "http://parrotnote.de:8888/postImage").responseJSON { (response) in
                debugPrint(response)
            }
        }
    
}
