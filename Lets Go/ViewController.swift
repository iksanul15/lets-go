//
//  ViewController.swift
//  Lets Go
//
//  Created by Muhammad Iksanul on 05/03/20.
//  Copyright © 2020 Lunaski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isStart = false //Random start status
    var data: Array<Activity> = Array()
    
    @IBOutlet weak var mainImage: UIImageView!{
        didSet{
            mainImage.layer.cornerRadius = 20
            mainImage.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var startBtn: UIButton!{
        didSet{
            startBtn.layer.cornerRadius = 20
            startBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var activityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityLabel.text = "What we will do?"
        createData()
    }
    
    // for change value of activity
    func changeLabelValue(activityName: String, activityPict: String) {
        activityLabel.text = "Lets Go\n\(activityName)!"
        activityLabel.halfTextColorChange(
            fullText: activityLabel.text!,
            changeText: activityName,
            withColor: #colorLiteral(red: 1, green: 0.5833400488, blue: 0.1463939548, alpha: 1)
        )
        mainImage.image = UIImage(named: activityPict)
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        if isStart{
            let activity = data.randomElement()
            changeLabelValue(activityName: activity!.name!, activityPict: activity!.picture!)
            
            isStart = false
            sender.backgroundColor = #colorLiteral(red: 0.9737585187, green: 0.7355845571, blue: 0, alpha: 1)
            sender.setTitle("Start", for: UIControl.State.normal)
        } else{
            activityLabel.text = "What we will do?"
            isStart = true
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5833400488, blue: 0.1463939548, alpha: 1)
            sender.setTitle("Stop", for: UIControl.State.normal)
            mainImage.loadGif(name: "giphy")
        }
    }
    
    
    //setup data
    func createData() {
        data.append(Activity(name: "play Dota 2", picture: "dota2"))
        data.append(Activity(name: "Nonton Bioskop", picture: "bioskop"))
        data.append(Activity(name: "play Mobile Lagend", picture: "ml"))
        data.append(Activity(name: "play PUBG Mobile", picture: "pubgm"))
        data.append(Activity(name: "play UNO Card", picture: "uno-card"))
        data.append(Activity(name: "play UNO STACKO", picture: "uno-stacko"))
        data.append(Activity(name: "Ngopi ngopi", picture: "ngopi"))
        data.append(Activity(name: "Jalan jalan ke mall", picture: "mall"))
        data.append(Activity(name: "nongkrong di kafe", picture: "caffe"))
        data.append(Activity(name: "nonton live music", picture: "live-music"))
    }
}
