//
//  Card.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/22/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

public struct Card {
    
    public let number: Number
    public let suit: Suit
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

extension SequenceType where Generator.Element == Card {
    func sortedCards() -> [Card] {
        return self.sort { $0.suit.rawValue == $1.suit.rawValue ? $0.number.orderValue < $1.number.orderValue : $0.suit.rawValue < $1.suit.rawValue }
    }
}

extension Card: Equatable {
}

public func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.number == rhs.number && lhs.suit == rhs.suit
}