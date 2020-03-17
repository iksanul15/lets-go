//
//  CategoryViewController.swift
//  Lets Go
//
//  Created by Muhammad Iksanul on 12/03/20.
//  Copyright © 2020 Lunaski. All rights reserved.
//

import UIKit

enum Category{
    case game
    case food
    case hangout
    case random
}

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var hangoutButton: UIButton!
    
    var category = Category.random
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameButton.layer.cornerRadius = 5
        gameButton.layer.masksToBounds = true
        gameButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: +16, bottom: 0, right: 0)
        
        hangoutButton.layer.cornerRadius = 5
        hangoutButton.layer.masksToBounds = true
        hangoutButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: +16, bottom: 0, right: 0)
        
        foodButton.layer.cornerRadius = 5
        foodButton.layer.masksToBounds = true
        foodButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: +16, bottom: 0, right: 0)
        
        randomButton.layer.cornerRadius = 5
        randomButton.layer.masksToBounds = true
        randomButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: +16, bottom: 0, right: 0)
    }
    
    @IBAction func openRandomPage(_ sender: UIButton) {
        switch sender {
        case gameButton:
            category = .game
            break
        case foodButton:
            category = .food
            break
        case hangoutButton:
            category = .hangout
            break
        default:
            category = .random
            break
        }
        
        performSegue(withIdentifier: "RandomView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "RandomView"{
                let destinationView = segue.destination as? ViewController
                destinationView?.category = category
            }
        }
    }
}
