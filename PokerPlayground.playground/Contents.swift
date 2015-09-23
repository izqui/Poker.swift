//: Playground - noun: a place where people can play

import Cocoa
import Poker

var str = "Hello, playground"
let deck = Poker.startGame()


;.Jack |*| .Diamonds


let cards = [.Ace |*| .Spades, .King |*| .Spades, .Queen |*| .Spades, .Jack |*| .Spades, .Ten |*| .Spades]
let h = Hand(cards: cards)
h.valueHand()