//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dice1.image = #imageLiteral(resourceName: "DiceSix") // command + shift + L
        dice2.image = UIImage(imageLiteralResourceName: "DiceFour") // direct
        dice1.alpha = 0.5
        dice2.alpha = 1
    }

    @IBAction func rollButton(_ sender: Any) {
        let diceFaces = [UIImage(imageLiteralResourceName: "DiceOne"), UIImage(imageLiteralResourceName: "DiceTwo"), UIImage(imageLiteralResourceName: "DiceThree"),
            UIImage(imageLiteralResourceName: "DiceFour"),
            UIImage(imageLiteralResourceName: "DiceFive"),
            UIImage(imageLiteralResourceName: "DiceSix")
        ]
        let randomDice1Index = Int.random(in: 0...5) // more mem: diceFaces.randomElement()
        let randomDice2Index = Int.random(in: 0...5)
        dice1.image = diceFaces[randomDice1Index]
        dice2.image =  diceFaces[randomDice2Index]
        
    }
    
}

