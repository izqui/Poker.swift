//: Playground - noun: a place where people can play

import Cocoa
import Poker

var str = "Hello, playground"
let deck = Poker.startGame()


;.Jack |*| .Diamonds

Hand(cards: [.Ace |*| .Spades, .Two |*| .Hearts, .Two |*| .Spades, .Three |*| .Hearts, .Four |*| .Diamonds]).valueHand()
