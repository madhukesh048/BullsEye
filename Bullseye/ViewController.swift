//
//  ViewController.swift
//  Bullseye
//
//  Created by Madhukesh on 19/09/19.
//  Copyright © 2019 Madhukesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue: Float = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let message = "The value of slider is \(currentValue)" + "\n The target value is \(targetValue)"
        let alert = UIAlertController(title: "Hello,World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        startNewRound()
    }
   
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
}

    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        print("startNewRound: TARGET: \(targetValue)")
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    func updateLabel(){
        print("TARGET: \(targetValue)")
        targetLabel.text = "\(targetValue)"
    }

}
