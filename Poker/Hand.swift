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
    
    public enum Value {
        case StraightFlush
        case FourOfAKind
        case FullHouse
        case Flush
        case Straight
        case Pack
        case DoublePair
        case Pair
        case HighCard
    }
    
    public struct RealValue {
        let value: Value
        let order: [Number]
    }
    
    public func valueHand() -> RealValue {
            
        let numbers = self.cards.map { $0.number }

        let (p, n) = detectPair(numbers)
        guard !p else { return RealValue(value: .Pair, order: n) }
        
        return RealValue(value: .HighCard, order: [.Ace])
    }
}


func detectPair(numbers: [Number]) -> (Bool, [Number]) {
    
    let frecuencies = numberFrecuencies(numbers)
    let paired = frecuencies.filter {
        _, v in
        v == 2
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
    return numbers.map{ $0.rawValue }.reduce([Int:Int]()) {
        a, e in
        var newa = a
        newa[e] = (a[e] ?? 0) + 1
        return newa
    }
}

