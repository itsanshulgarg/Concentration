//
//  ViewController.swift
//  Concentration
//
//  Created by Anshul Garg on 23/07/18.
//  Copyright © 2018 Anshul Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    @IBOutlet var cardButton: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices = ["🎃", "♠️", "🎃", "♠️", "♦️", "♦️", "🌼", "🌼", "⚜️", "⚜️", "🍀", "🍀", "👽", "👽", "⚽️", "⚽️"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Not in cardButtons")
        }

    }
    
    func flipCard(withEmoji emoji : String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
}

}
