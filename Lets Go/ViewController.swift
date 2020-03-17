//
//  ViewController.swift
//  Lets Go
//
//  Created by Muhammad Iksanul on 05/03/20.
//  Copyright © 2020 Lunaski. All rights reserved.
//

import UIKit
import AVFoundation

//NC2
class ViewController: UIViewController {
    
    var isStart = false //Random start status
    var data: Array<Activity> = Array()
    
    var category = Category.random
    var soundEffect: AVAudioPlayer?
    
    let gamesResource = [
        "Play Dota 2": "dota2",
        "Play Mobile Lagend": "ml",
        "Play PUBG Mobile": "pubgm",
        "Play UNO Card": "uno-card",
        "Play UNO Stacko": "uno-stacko"
    ]
    
    let foodsResource = [
        "Makan Makan di KFC": "kfc",
        "Makan Makan di McD": "mcd",
        "Makan Ayam Geprek": "ayam-geprek",
        "Makan Bebek Goreng": "bebek-goreng",
        "Makan Bakso": "bakso",
        "Makan di Pizza Hut": "ph"
    ]
    
    let hangoutResource = [
        "Ngopi Ngopi": "ngopi",
        "Jalan Jalan ke Mall": "mall",
        "Nongkrong di Kafe": "caffe",
        "Nonton Bioskop": "bioskop",
        "Nonton Live Music": "live-music",
    ]
    
    @IBOutlet weak var mainImage: UIImageView!{
        didSet{
            mainImage.layer.cornerRadius = 5
            mainImage.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var startBtn: UIButton!{
        didSet{
            startBtn.layer.cornerRadius = 5
            startBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var activityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityLabel.text = "What we will do?"
        print(category)
        createData()
    }
    
    // for change value of activity
    func changeLabelValue(activityName: String, activityPict: String) {
        activityLabel.text = "Lets Go\n\(activityName)!"
        activityLabel.halfTextColorChange(
            fullText: activityLabel.text!,
            changeText: "\(activityName)!",
            withColor: #colorLiteral(red: 1, green: 0.5833400488, blue: 0.1463939548, alpha: 1)
        )
        mainImage.image = UIImage(named: activityPict)
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        playSound(isStart: isStart)
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
        switch category {
        case .game:
            for item in gamesResource{
                data.append(Activity(name: item.key, picture: item.value))
            }
            break
        case .food:
            for item in foodsResource{
                data.append(Activity(name: item.key, picture: item.value))
            }
            break
        case .hangout:
            for item in hangoutResource{
                data.append(Activity(name: item.key, picture: item.value))
            }
            break
        case .random:
            for item in gamesResource{
                data.append(Activity(name: item.key, picture: item.value))
            }
            for item in foodsResource{
                data.append(Activity(name: item.key, picture: item.value))
            }
            for item in hangoutResource{
                data.append(Activity(name: item.key, picture: item.value))
            }
            break
        }
    }
    
    func playSound(isStart: Bool){
        let path = Bundle.main.path(forResource: "random.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        if !isStart {
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url)
                soundEffect?.numberOfLoops = -1
                soundEffect?.play()
            } catch {
                print("error")
            }
        } else{
            soundEffect?.stop()
        }
    }
}
