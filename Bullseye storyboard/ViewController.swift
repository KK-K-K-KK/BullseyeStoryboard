//
//  ViewController.swift
//  Bullseye storyboard
//
//  Created by Kevin Kuan on 2023/2/12.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue : Int = 0
    
    @IBOutlet weak var slider: UISlider!

    func setSliderValue() {
        sliderValue = Int((slider.value * 100).rounded())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSliderValue()
    }
    

    @IBAction func showAlert() {
        var alert = UIAlertController(title: "Boom!", message: "The slider value is \(sliderValue).", preferredStyle: .alert)
        var alertAction = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        setSliderValue()
    }
}

