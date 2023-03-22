//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

class StoryBrain {
    var stories = [
        Story(description: "You see a fork in the road", choice1: "go left", choice2: "go right"),
        Story(description: "You see a tiger", choice1: "Shout for help", choice2: "Play dead"),
        Story(description: "You finda  treasure chest", choice1: "Open it", choice2: "Check for trapss")
    ]
    var currentPath: Array<Int> = []
    var currentStory: Story? = nil
    
    init (extraStories: Array<Story>?) {
        self.stories = stories + (extraStories ?? [])
        self.currentStory = self.stories[0]
    }
    
    func choiceMade (choice1Selected: Bool) {
        if (choice1Selected) {
            self.currentPath.append(0)
        } else {
            self.currentPath.append(1)
        }
        
        if (self.currentStory?.description == self.stories[0].description) {
            if (choice1Selected) {
                self.currentStory = self.stories[1]
            } else {
                self.currentStory = self.stories[2]
            }
        }
        
        return
    }
}
