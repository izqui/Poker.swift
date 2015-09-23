//: Playground - noun: a place where people can play

import Cocoa
import Poker

var str = "Hello, playground"
let deck = Poker.startGame()


;.Jack |*| .Diamonds


let cards = [.Ace |*| .Hearts, .Three |*| .Spades, .Two |*| .Spades, .Ace |*| .Spades, .Ace |*| .Spades]
let h = Hand(cards: cards)
h.valueHand()