//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var heightValue: UISlider!
    @IBOutlet weak var weightValue: UISlider!
    @IBAction func heightChanged(_ sender: UISlider) {
        heightValueLabel.text = String(round(sender.value * 10)/10) + "m"
    }
    @IBAction func weightChanged(_ sender: UISlider) {
        weightValueLabel.text = String(Int(sender.value)) + "kg"
    }
    @IBAction func calculatePressed(_ sender: Any) {
        calculatorBrain.calculateBMI(height: heightValue.value, weight: weightValue.value)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.bmi
            destinationVC.color = calculatorBrain.color
            destinationVC.advice = calculatorBrain.advice
        }
    }
}

