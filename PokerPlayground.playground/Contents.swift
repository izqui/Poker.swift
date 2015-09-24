//: Playground - noun: a place where people can play

import Cocoa
import Poker

let deck = Poker.startGame()


;.Jack |*| .Diamonds

;.Ten |*| .Clubs

let cards = [.Ace |*| .Spades, .Ace |*| .Hearts, .Two |*| .Spades, .Ten |*| .Hearts, .Ten |*| .Spades]
let h = Hand(cards: cards)
h.valueHand()

let cards2 = [.Ace |*| .Spades, .Ace |*| .Clubs, .Jack |*| .Diamonds, .King |*| .Diamonds, .King |*| .Hearts]

//let cards3 = [.Ace |*| .Spades, .Ace |*| .Clubs, .Seven |*| .Diamonds, .Jack |*| .Diamonds, .Jack |*| .Hearts]

bestHand(Hand(cards: cards), Hand(cards: cards2)).valueHand()