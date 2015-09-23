//
//  Card.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/22/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

public struct Card {
    
    let number: Number
    let suit: Suit
}

extension Card: Emojiable {
    var emojiValue: String {
         return self.number.emojiValue + self.suit.emojiValue
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        return self.emojiValue
    }
}

public func |*| (lhs: Number, rhs: Suit) -> Card {
    return Card(number: lhs, suit: rhs)
}