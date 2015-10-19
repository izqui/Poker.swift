//
//  Combiantions.swift
//  Poker
//
//  Created by Jorge Izquierdo on 10/19/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

import XCTest
@testable import Poker

class TableValue: XCTestCase {
    
    var table: Table!
    
    override func setUp() {
        table = Table(cards: [.Ace |*| .Spades, .King |*| .Diamonds])
    }
    
    func testPairvsHighcard() {
        
        let hand1 = table.bestHandWithCards([.Ace |*| .Diamonds, .Two |*| .Spades, .Three |*| .Diamonds, .Seven |*| .Diamonds, .Five |*| .Hearts])!
        let hand2 = table.bestHandWithCards([.Three |*| .Spades, .Three |*| .Clubs, .Seven |*| .Diamonds, .Queen |*| .Diamonds, .Jack |*| .Hearts])!
        
        assertHandValue(bestHand(hand1, hand2).cards, .Pair)
    }
    
    func testPokervsStraightFlush() {
        
        let hand1 = table.bestHandWithCards([.Ace |*| .Diamonds, .Ace |*| .Hearts, .Ace |*| .Clubs, .Seven |*| .Diamonds, .Five |*| .Hearts])!
        let hand2 = table.bestHandWithCards([.Jack |*| .Spades, .Queen |*| .Spades, .Seven |*| .Diamonds, .King |*| .Spades, .Ten |*| .Spades])!
        
        assertHandValue(bestHand(hand1, hand2).cards, .StraightFlush)
    }
}
