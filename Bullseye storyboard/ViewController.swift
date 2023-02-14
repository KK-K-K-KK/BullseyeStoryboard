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
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    func setSliderValue() {
        sliderValue = Int((slider.value * 100).rounded())
    }
    
    func startNewRound() {
        slider.value = 0.5
        setSliderValue()
        roundValue += 1
        roundLabel.text = String(roundValue)
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }
    

    @IBAction func showAlert() {
        let message = "The slider value is \(sliderValue).\n The target value is \(targetValue).\n This is round \(roundValue)."
        let alert = UIAlertController(title: "Boom!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        setSliderValue()
    }
    
    
}

