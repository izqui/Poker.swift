//: Playground - noun: a place where people can play

import Cocoa
import Poker

let deck = Poker.startGame()

let cards = [.Ace |*| .Spades, .Ace |*| .Hearts, .Ten |*| .Spades, .Five |*| .Hearts, .Ten |*| .Spades]
Hand(cards: cards).valueHand()

let t = Table(cards: cards)
let b1 = t.bestHandWithCards([.Ten |*| .Clubs, .Jack |*| .Diamonds])!
let b2 = t.bestHandWithCards([.Ace |*| .Clubs, .Ace |*| .Diamonds])!

bestHand(b1, b2).valueHand()
