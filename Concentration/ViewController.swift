//
//  ViewController.swift
//  Concentration
//
//  Created by Anshul Garg on 23/07/18.
//  Copyright © 2018 Anshul Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButton.count + 1 ) / 2)
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips : \(flipCount)"
        } 
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Not in cardButtons")
        }

    }
    func updateViewFromModel(){
        for index in cardButton.indices{
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)

            }
        
        }

    }
    var emojiChoices = ["🎃", "♠️", "🎃", "♠️", "♦️", "♦️", "🌼", "🌼", "⚜️", "⚜️", "🍀", "🍀", "👽", "👽", "⚽️", "⚽️"]
    
    var emoji = [Int:String]()
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier]=emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    @IBOutlet var cardButton: [UIButton]!


}
