//
//  MemorizeGame.swift
//  memorize
//
//  Created by Jared SJ on 8/6/25.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card> // only initializing the card variable is private, can still read the var
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
    }
}
