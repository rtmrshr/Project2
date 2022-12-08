//
//  ViewController.swift
//  Project2
//
//  Created by  ratmir on 07.12.2022.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var endTitle: String?
        questionsAsked += 1
        
        if questionsAsked == 10 {
            endTitle = "The end"
            let endAC = UIAlertController(title: endTitle, message: "Your final score \(score)", preferredStyle: .alert)
            endAC.addAction(UIAlertAction(title: "Restart game", style: .default, handler: gameEnd))
            present(endAC, animated: true)
            
            questionsAsked = 0
            score = 0
            askQuestion()
        }
        
        var title: String
        var rightAnswer = ""
        
        if sender.tag == correctAnswer{
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong!"
            score -= 1
            rightAnswer = "That's the flag of \(countries[sender.tag].capitalized)"
        }
        
        let ac = UIAlertController(title: (title + " " + rightAnswer), message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button1.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        button2.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        button3.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        // .setImage() assigns UIImage to the button.
        // for: .normal The setImage() method takes a second parameter that describes which state of the button should be changed. We're specifying .normal, which means "the standard state of the button"
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = ("\(countries[correctAnswer].uppercased()), your score is \(score)")
    }
    
    func gameEnd(action: UIAlertAction! = nil) {
        
    }
}

