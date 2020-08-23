//
//  UserViewController.swift
//  Sportable
//
//  Created by Shreeniket Bendre on 8/23/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class UserViewController: UIViewController, YTPlayerViewDelegate {

    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var textView: UITextView!
    
    var str = "A push-up (or press-up if the hands are wider than shoulders placing more emphasis on the pectoral muscles) is a common calisthenics exercise beginning from the prone position. By raising and lowering the body using the arms, push-ups exercise the pectoral muscles, triceps, and anterior deltoids, with ancillary benefits to the rest of the deltoids, serratus anterior, coracobrachialis and the midsection as a whole. Push-ups are a basic exercise used in civilian athletic training or physical education and commonly in military physical training. They are also a common form of punishment used in the military, school sport, and some martial arts disciplines."
    var id = "IODxDxX7oi4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.delegate = self
        setup(id, str)

        // Do any additional setup after loading the view.
    }
    
    func setup(_ id: String, _ text: String){
        
        textView.text = text
        playerView.load(withVideoId: "\(id)", playerVars: ["playsinline":1])
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
    @IBAction func b1(_ sender: Any){
        playerView.stopVideo()
        str = "A push-up (or press-up if the hands are wider than shoulders placing more emphasis on the pectoral muscles) is a common calisthenics exercise beginning from the prone position. By raising and lowering the body using the arms, push-ups exercise the pectoral muscles, triceps, and anterior deltoids, with ancillary benefits to the rest of the deltoids, serratus anterior, coracobrachialis and the midsection as a whole. Push-ups are a basic exercise used in civilian athletic training or physical education and commonly in military physical training. They are also a common form of punishment used in the military, school sport, and some martial arts disciplines."
        id = "IODxDxX7oi4"
        setup(id, str)
        
    }
    @IBAction func b2(_ sender: Any){
        playerView.stopVideo()
        str = "The sit-up (or curl-up) is an abdominal endurance training exercise to strengthen, tighten and tone the abdominal muscles. It is similar to a crunch (crunches target the rectus abdominis and also work the biceps and external and internal obliques), but sit-ups have a fuller range of motion and condition additional muscles."
        id = "1fbU_MkV7NE"
        setup(id, str)
    }
    @IBAction func b3(_ sender: Any){
        playerView.stopVideo()
        str = "The crunch is one of the most popular abdominal exercises. When performed properly, it engages all the abdominal muscles but primarily it works the rectus abdominis muscle and the obliques. It allows both building six-pack abs, and tightening the belly. Crunches use the exerciser's own body weight to tone muscle, and are recommended as a low-cost exercise that can be performed at home"
        id = "9FGilxCbdz8"
        setup(id, str)
        
    }
    @IBAction func b4(_ sender: Any){
        playerView.stopVideo()
        str = "The burpee, a squat thrust with an additional stand between reps, is a full body exercise used in strength training and as an aerobic exercise. The basic movement is performed in four steps and known as a four-count burpee"
        id = "rg0f_LYhqQA"
        setup(id, str)
    }
    @IBAction func b5(_ sender: Any){
        playerView.stopVideo()
        str = "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent of a squat, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up."
        id = "C_VtOYc6j5c"
        setup(id, str)
    }
    @IBAction func b6(_ sender: Any){
        playerView.stopVideo()
        str = "A pull-up is an upper-body strength exercise. The pull-up is a closed-chain movement where the body is suspended by the hands and pulls up. As this happens, the elbows flex and the shoulders adduct and extend to bring the elbows to the torso."
        id = "8YsYbuyTPHg"
        setup(id, str)
    }
    @IBAction func b7(_ sender: Any){
        playerView.stopVideo()
        str = "A jumping jack, also called side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide and the hands going overhead, sometimes in a clap, and then returning to a position with the feet together and the arms at the sides."
        id = "UpH7rm0cYbM"
        setup(id, str)
    }
    @IBAction func b8(_ sender: Any){
        playerView.stopVideo()
        str = "Strength training involves the performance of physical exercises which are designed to improve strength and endurance. It is often associated with the use of weights but can take a variety of different forms."
        id = "ykJmrZ5v0Oo"
        setup(id, str)
    }
    

    
}
