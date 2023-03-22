//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    let storyBrain = StoryBrain(extraStories: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialStory = storyBrain.currentStory ?? storyBrain.stories[0]
        choice1Button.setTitle(initialStory.choice1, for: .normal)
        choice2Button.setTitle(initialStory.choice2, for: .normal)
        storyLabel.text = initialStory.description
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let isChoice1 = (sender.titleLabel?.text == choice1Button.titleLabel?.text)
        storyBrain.choiceMade(choice1Selected: isChoice1)
        updateUI()
    }
    
    func updateUI() {
        guard let currentStory = storyBrain.currentStory else {return}
        choice1Button.setTitle(currentStory.choice1, for: .normal)
        choice2Button.setTitle(currentStory.choice2, for: .normal)
        storyLabel.text = currentStory.description
    }
}

