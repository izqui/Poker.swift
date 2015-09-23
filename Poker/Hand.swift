//
//  Hand.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/22/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

public struct Hand {
    
    public let cards: [Card]
    
    public init(cards: [Card]) {
        self.cards = cards
    }
    
    public enum Value: Int {
        case StraightFlush = 0
        case FourOfAKind
        case FullHouse
        case Flush
        case Straight
        case ThreeOfAKind
        case DoublePair
        case Pair
        case HighCard
    }
    
    public struct RealValue: CustomStringConvertible {
        let value: Value
        let order: [Number]
        public var description: String {
            return String(value) + self.order.reduce(" ") { $0 + $1.emojiValue }
        }
    }
    
    public func valueHand() -> RealValue {
            
        let numbers = self.cards.map { $0.number }
        
        // Shared detections
        let (isFlush, flushNumbers) = detectFlush(self.cards)
        let (isStraight, straightNumbers) = detectStraight(numbers)
        let (isPair, pairNumbers) = detectGroup(numbers, count: 2) // Detect first pair
        let (isTrio, trioNs) = detectGroup(numbers, count: 3)
        
        // Check for Straight Flush
        guard !isFlush || !isStraight else { return RealValue(value: .StraightFlush, order: straightNumbers)}
        
        // Check for Four of a Kind
        let (isFour, fourNs) = detectGroup(numbers, count: 4)
        guard !isFour else { return RealValue(value: .FourOfAKind, order: fourNs) }
        
        // Check for full
        let (isFullPair, fullNumbers) = detectGroup(trioNs, count: 2)
        guard !isPair || !isFullPair else {
            
            let firsts = [trioNs[0], fullNumbers[0]]
            let merged = firsts + fullNumbers.filter { !firsts.contains($0) }
            
            return RealValue(value: .FullHouse, order: merged)
        }
        
        // Check for Flush
        guard !isFlush else { return RealValue(value: .Flush, order: flushNumbers)}
        
        // Check for Straight
        guard !isStraight else { return RealValue(value: .Straight, order: straightNumbers)}
        
        // Check for Three of a Kind
        guard !isTrio else { return RealValue(value: .ThreeOfAKind, order: trioNs) }
        
        // Check for Double Pair
        let (p2, n2) = detectGroup(pairNumbers, count: 2)
        guard !isPair || !p2 else {
            
            let firsts = [max(pairNumbers[0], n2[0]), min(pairNumbers[0], n2[0])] // First in the array are the paired numbers ordered
            let merged = firsts + n2.filter { !firsts.contains($0) } // And then all the order numbers
            return RealValue(value: .DoublePair, order: merged)
        }
        
        // Check for Pair
        guard !isPair else { return RealValue(value: .Pair, order: pairNumbers) }
        
        // Last option is just high card
        return RealValue(value: .HighCard, order: numbers.sort { $0.rawValue > $1.rawValue })
    }
}

extension Hand: CustomStringConvertible {
    public var description: String {
        return self.cards.reduce("Hand: ") { $0 + $1.description + " " }
    }
}

func detectStraight(numbers: [Number]) -> (Bool, [Number]){
    
    // Beware of the ace. It can be used in A2345 and 10JQKA
    let sortedNumbers = numbers.flatMap { $0.straightValues }.sort()
    var allowedErrors = sortedNumbers.count - numbers.count
    
    guard sortedNumbers.count <= numbers.count + 1 else { return (false, [])}
    
    var lastNumber = sortedNumbers[0]
    var straightNumber = sortedNumbers[0]
    for i in 1..<sortedNumbers.count {
        if sortedNumbers[i]-lastNumber != 1 {
            if allowedErrors-- <= 0 {
                return (false, [])
            }
        } else {
            straightNumber = sortedNumbers[i]
        }
        lastNumber = sortedNumbers[i]
    }
    
    return (true, [Number(rawValue: straightNumber)!])
}

func detectFlush(cards: [Card]) -> (Bool, [Number]) {
    
    let firstCard = cards[0]
    let sameSuit = cards.filter { $0.suit == firstCard.suit }
    
    guard sameSuit.count == cards.count else { return (false, []) }
    
    let orderedNumbers = cards.map { $0.number }.sort { $0.rawValue > $1.rawValue }
    
    return (true, orderedNumbers)
}

func detectGroup(numbers: [Number], count: Int) -> (Bool, [Number]) {
    
    let frecuencies = numberFrecuencies(numbers)
    let paired = frecuencies.filter {
        _, v in
        v == count
        }.map {
            k,_ in
            k
    }
    
    guard paired.count > 0 else { return (false, []) }
    let pair = paired[0]
    let notPaired = numbers.map { $0.rawValue }.filter { $0 != pair }.sort { $0 > $1 }
    let remaining = ([pair] + notPaired).map { Number(rawValue: $0)! }
    return (true, remaining)
}

func numberFrecuencies(numbers: [Number]) -> [Int:Int] {
    return numbers.map { $0.rawValue }.reduce([Int:Int]()) {
        a, e in
        var newa = a
        newa[e] = (a[e] ?? 0) + 1
        return newa
    }
}

