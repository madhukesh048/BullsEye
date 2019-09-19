//
//  ViewController.swift
//  Bullseye
//
//  Created by Madhukesh on 19/09/19.
//  Copyright © 2019 Madhukesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue: Float = slider.value.rounded()
        currentValue = Int(roundedValue)
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftReziable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftReziable, for: .normal)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightReziable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightReziable, for: .normal)
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
      let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        score += points
        let title: String
        if(difference == 0){
           title = "Perfect!"
            points += 100
        } else if(difference < 5){
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        } else if(difference < 10){
            title = "Pretty good!"
        } else {
            title = "Not even close.."
        }

        let message = "You Scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
   
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    

    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        
    }
    
    func updateLabel(){
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
   
    @IBAction func startOver(){
        score = 0
        round = 0
        startNewRound()
    }
}
