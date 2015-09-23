//: Playground - noun: a place where people can play

import Cocoa
import Poker

let deck = Poker.startGame()


;.Jack |*| .Diamonds

;.Ten |*| .Clubs

let cards = [.Ace |*| .Spades, .Ace |*| .Hearts, .Ace |*| .Spades, .Ten |*| .Hearts, .Ten |*| .Spades]
let h = Hand(cards: cards)
h.valueHand()
