//
//  HandValue.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/23/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

import XCTest
@testable import Poker

class HandValue: XCTestCase {
    
    func testHighcard() {
        let cards = [.Ace |*| .Spades, .Three |*| .Clubs, .Seven |*| .Diamonds, .King |*| .Diamonds, .Jack |*| .Hearts]
        assertHandValue(cards, .HighCard)
    }
    
    func testPair() {
        let cards = [.Ace |*| .Spades, .Ace |*| .Clubs, .Seven |*| .Diamonds, .King |*| .Diamonds, .Jack |*| .Hearts]
        assertHandValue(cards, .Pair)
    }
    
    func testDoublePair() {
        let cards = [.Ace |*| .Spades, .Ace |*| .Clubs, .Seven |*| .Diamonds, .Jack |*| .Diamonds, .Jack |*| .Hearts]
        assertHandValue(cards, .DoublePair)
    }
    
    func testThreeOfAKind() {
        let cards = [.Ace |*| .Spades, .Ace |*| .Clubs, .Ace |*| .Diamonds, .King |*| .Diamonds, .Jack |*| .Hearts]
        assertHandValue(cards, .ThreeOfAKind)
    }
    
    func testFullHouse() {
        let cards = [.Ace |*| .Spades, .Ace |*| .Clubs, .King |*| .Diamonds, .King |*| .Diamonds, .King |*| .Hearts]
        assertHandValue(cards, .FullHouse)
    }
    
    func testFlush() {
        let cards = [.Ace |*| .Spades, .Ace |*| .Spades, .Seven |*| .Spades, .King |*| .Spades, .Jack |*| .Spades]
        assertHandValue(cards, .Flush)
    }
    
    func testStraight() {
        let cards = [.Ace |*| .Spades, .Two |*| .Clubs, .Three |*| .Diamonds, .Four |*| .Diamonds, .Five |*| .Hearts]
        assertHandValue(cards, .Straight)
    }
    
    func testFourOfAKind() {
        let cards = [.Ace |*| .Spades, .Two |*| .Clubs, .Ace |*| .Diamonds, .Ace |*| .Diamonds, .Ace |*| .Hearts]
        assertHandValue(cards, .FourOfAKind)
    }
    
    func testStraightFlush() {
        let cards = [.Ace |*| .Spades, .Two |*| .Spades , .Three |*| .Spades, .Four |*| .Spades, .Five |*| .Spades]
        assertHandValue(cards, .StraightFlush)
    }
    
}

func assertHandValue(cards: [Card], _ value: Hand.Value) {
    
     XCTAssertEqual(Hand(cards: cards).valueHand().value, value)
}