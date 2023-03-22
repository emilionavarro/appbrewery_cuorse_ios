//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Emilio Navarro on 3/21/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var bmiValue: Float = 0.0
    var color: UIColor = .blue
    var advice: String = ""
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var actionUILabel: UILabel!
    @IBOutlet weak var bmiUILabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiUILabel.text = String(format: "%.1f", bmiValue)
        actionUILabel.text = advice
        backgroundImage.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
