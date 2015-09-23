//
//  Number.swift
//  Poker
//
//  Created by Jorge Izquierdo on 9/22/15.
//  Copyright © 2015 Jorge Izquierdo. All rights reserved.
//

public enum Number: Int {
    
    case Two = 1
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
    case Ace
    
    static func allNumbers() -> [Number] {
        return (1...13).flatMap { Number(rawValue: $0) }
    }
}

// Ace different value
public extension Number {

    var orderValue: Int {
        return self == .Ace ? 0 : self.rawValue
    }
    
    public var straightValues: [Int] {
        return [self.rawValue] + (self == .Ace ? [0] : [])
    }
}

extension Number: Emojiable {
    var emojiValue: String {
        let map = "2⃣️3⃣️4⃣️5⃣️6⃣️7⃣️8⃣️9⃣️🔟🎃👸👑1⃣️"
        return map[self.rawValue-1]
    }
}

extension Number: Comparable {}

public func <(lhs: Number, rhs: Number) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func <= (lhs: Number, rhs: Number) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: Number, rhs: Number) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}

public func >(lhs: Number, rhs: Number) -> Bool {
    return lhs.rawValue > rhs.rawValue
}
