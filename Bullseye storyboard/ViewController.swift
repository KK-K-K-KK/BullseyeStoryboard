//
//  ViewController.swift
//  Bullseye storyboard
//
//  Created by Kevin Kuan on 2023/2/12.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue : Int = 0
    var roundValue : Int = 0
    var targetValue : Int = 0
    var scoreValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    func setSliderValue() {
        sliderValue = Int((slider.value * 100).rounded())
    }
    
    func startNewRound() {
        slider.value = 0.5
        setSliderValue()
        roundValue += 1
        roundLabel.text = String(roundValue)
        targetValue = Int.random(in: 0...100)
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(scoreValue)
    }
    
    func endRound() {
        let difference = abs(targetValue - sliderValue)
        let points: Int
        if (difference == 0) {
            points = 200
        }
        else if (difference == 1) {
            points = 150
        }
        else {
            points = 100 - difference
        }
            
        
        scoreValue = scoreValue + points
        
        let message = "You scored \(points) points!"
        let title : String
        if (points == 100) {
            title = "Perfect!"
        }
        else if (points >= 90) {
            title = "You almost had it!"
        }
        else {
            title = "Better luck next time!"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Try again", style: .default, handler: {
            alertAction in
            self.startNewRound()
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }
    

    @IBAction func showAlert() {
        endRound()
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        setSliderValue()
    }
    
    @IBAction func startOver() {
        sliderValue = 0
        roundValue = 0
        targetValue = 0
        scoreValue = 0
        startNewRound()
    }
    
    
}

