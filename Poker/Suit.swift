//
//  Suit.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/22/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

public enum Suit: Int {
    case Clubs = 0
    case Hearts
    case Diamonds
    case Spades
    
    static func allSuits() -> [Suit] {
        return [.Clubs, .Hearts, .Diamonds, .Spades]
    }
}

extension Suit: Emojiable {
    var emojiValue: String {
        switch self {
        case .Clubs: return "♣️"
        case .Hearts: return "♥️"
        case .Diamonds: return "♦️"
        case .Spades: return "♠️"
        }
    }
}