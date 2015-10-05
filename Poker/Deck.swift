//
//  Deck.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/22/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

public struct Deck {
    
    let cards: [Card]
    
    static func newDeck() -> Deck {
        
        let suits = Suit.allSuits()
        let numbers = Number.allNumbers()
        
        return Deck(cards: combine(numbers, suits) { Card(number: $0, suit: $1) })
    }
    
    func orderedDeck() -> Deck {
        
        return Deck(cards: self.cards.sortedCards())
    }
    
    func shuffleDeck() -> Deck {
        return Deck(cards: self.cards)
    }
    
    func popCard() -> (Card, Deck) {
        return (self.cards[0], Deck(cards: [Card](self.cards[1..<self.cards.count])))
    }
}

extension Deck: CustomStringConvertible {
    public var description: String {
        return self.cards.reduce("Deck: ") { $0 + $1.description + " " }
    }
}
// Does it already exist in swift?
func combine<U,V,T>(left: [U], _ right: [V], combinator: (U, V) -> T) -> [T] {
    return (0..<left.count*right.count).map { i in combinator(left[i%left.count], right[i%right.count]) }
}