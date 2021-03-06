//
//  Card.swift
//  Concentration
//
//  Created by Anshul Garg on 29/10/18.
//  Copyright © 2018 Anshul Garg. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
