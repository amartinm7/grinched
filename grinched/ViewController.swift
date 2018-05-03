//
//  ViewController.swift
//  BullsEye
//
//  Created by antonio martin moreno on 19/04/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var definition
    var score : Int = 0
    var round : Int = 0
    var targetValue = 0
    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var putTheSlideLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var ramdonNumberLbl: UILabel!
    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var roundValueLbl: UILabel!
    @IBOutlet weak var scoreValueLbl: UILabel!
    @IBOutlet weak var youWinLbl: UILabel!
    @IBOutlet weak var youLoseLbl: UILabel!
    @IBOutlet weak var hitLbl: UILabel!
    @IBOutlet weak var hitMeBtn: UIButton!
    @IBOutlet weak var starOverMeBtn: UIButton!
    @IBOutlet weak var helpBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //initGame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initGame()
        hitLbl.center.x -= view.bounds.width
        roundValueLbl.center.x -= view.bounds.width
        scoreValueLbl.center.x -= view.bounds.width
        putTheSlideLbl.center.x -= view.bounds.width
        textView.center.x -= view.bounds.width
        ramdonNumberLbl.center.x -= view.bounds.width
        helpBtn.center.x -= view.bounds.width
        hitMeBtn.center.y += 30.0
        hitMeBtn.alpha = 0.0
        roundLbl.center.y += 8
        roundLbl.alpha = 0.0
        scoreLbl.center.y += 8
        scoreLbl.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let boundsWith: CGFloat = self.view.bounds.width
        hitLbl.appearLeftToRight(boundsWith: boundsWith, delay:0.3)
        roundValueLbl.appearLeftToRight(boundsWith: boundsWith, delay:0.4)
        scoreValueLbl.appearLeftToRight(boundsWith: boundsWith, delay:0.5)
        putTheSlideLbl.appearLeftToRight(boundsWith: boundsWith, delay:0.6)
        textView.appearLeftToRight(boundsWith: boundsWith, delay:0.7)
        ramdonNumberLbl.appearLeftToRight(boundsWith: boundsWith, delay:0.8)
        helpBtn.appearLeftToRight(boundsWith: boundsWith, delay: 0.9)
        hitMeBtn.bounce(boundsWith: 30.0, delay:0.5)
        scoreLbl.bounce(boundsWith: 8, delay:0.6)
        roundLbl.bounce(boundsWith: 8, delay:0.7)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        var message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        playSoundOnHitMe()
        updateScores()
        if (currentValue == targetValue){
            youWinLbl.isHidden = false
            UIView.animate(withDuration: 2.0){
                self.youWinLbl.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }
            playSoundOnWin()
            message = "You win!!"
            toggleButtons()
        } else if (score >= 100 || round >= 5){
            youLoseLbl.isHidden = false
            UIView.animate(withDuration: 2.0) {
                self.youLoseLbl.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }/*
            UIView.animate(withDuration: 1.0, options: [.autoreverse, .curveLinear, .repeat], animations: {
                self.youLoseLbl.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            },*/
            playSoundOnLose()
            message = "You lose!!"
            toggleButtons()
        }
        hitLbl.isHidden = false
        hitLbl.text = String(currentValue)
        // showAlertMessage(message: message)
    }
    
    @IBAction func sliderMoved(_slider:UISlider){
        print("The value of the slider is now: \(_slider.value)")
        currentValue = lroundf(_slider.value)
    }
    
    @IBAction func startOver(){
        initGame()
    }
    
    func updateScores(){
        round = round + 1
        score = score + abs(targetValue - currentValue)
        updateLabels()
    }
    
    func showAlertMessage(message: String){
        let alert = UIAlertController(title: "hello buddy", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    func initGame(){
        playSoundOnStartOver()
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = 50
        currentValue = lroundf(slider.value)
        score = 0
        round = 0
        hitMeBtn.isHidden = false
        starOverMeBtn.isHidden = true
        updateLabels()
    }
    
    func toggleButtons(){
        hitMeBtn.isHidden = !hitMeBtn.isHidden
        starOverMeBtn.isHidden = !starOverMeBtn.isHidden
    }
    
    func updateLabels(){
        ramdonNumberLbl.text = String(targetValue)
        roundValueLbl.text = String(round)
        scoreValueLbl.text = String(score)
        youWinLbl.isHidden = true
        youLoseLbl.isHidden = true
        hitLbl.isHidden = true
    }
}

