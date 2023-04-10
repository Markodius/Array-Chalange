//
//  ContentView.swift
//  Array Chalange
//
//  Created by Mykola on 10.04.2023.
//

/*
 Build a UI with a label and two buttons below it, side by side.

 Create a new structure to represent a playing card

 It should keep track of a number from 1 to 13 (representing Ace to King)
 
 It should also keep track of the suit (Spades, Clubs, Hearts, Diamonds)
 
 Declare a "deck" property in your ContentView.swift that will be used to store many instances of this structure

 When the first button is tapped:

 Create an instance of your playing card structure and assign it a random number and suit.
 
 If this number and suit combination has been generated already, change the label to say: "Generated duplicate card."
 
 If the number/suit combination is new, then store this instance in your deck property and change the label to say, "Generated a ____ of ____" where the first blank is the number and second blank is the suit.
 
 Bonus points if you change the numbers 1, 11, 12, 13 to their respective names ("Ace", "Jack", "Queen", "King")
 
 Example: "Generated a King of Clubs"
 
 When the second button is tapped:

 Randomly select an instance from your deck property
 
 Change the label to say "Drew a ____ of ____" where the first blank is the number and second blank is the suit.
 
 Bonus points if you change the numbers 1, 11, 12, 13 to their respective names ("Ace", "Jack", "Queen", "King")
 
 Example: "Drew a King of Clubs"
 
 If this button is tapped when there are no cards in the deck, display the message: "No cards in the deck."

 */

import SwiftUI

// Creating Card structure
struct Card {
    // Store here number of card
    var number = 0
    // Store here card suite
    var suite = 0
}

struct ContentView: View {
    //Storing here card instances
    @State var deck = [Card]()
    
    var suites = ["Spades", "Clubs", "Hearts", "Diamonds"]
    
    @State var message = "Label"
    
    @State var generatedLog = [String]()
    
    var body: some View {
        VStack {
            Text(message)
            HStack {
                Button("Add Card") {
                    addCard()
                }
                
                Button("Draw Card") {
                    drawCard()
                }
            }
        }
        .padding()
    }
    
    func addCard() {
        // Create random card number and card suite
        let randomCardNumber = Int.random(in: 1...13)
        let randomCardSuite = Int.random(in: 0...3)
        
        // Create instance of new adding Card
        var newCard = Card()
        newCard.number = randomCardNumber
        newCard.suite = randomCardSuite
        
        // Save generated card log
        let numberSuiteString = String(newCard.number) + "/" + String(newCard.suite)
        
        // Logic of adding card
        if generatedLog.contains(numberSuiteString) {
            message = "Generated duplicate card."
        } else {
            // Could't find same cards
            
            // Store generated card log to check if it exists in the future draw
            generatedLog.append(numberSuiteString)
            
            // Store generated card to try draw it
            deck.append(newCard)
            
            // Get name and suite of the card
            let cardName = getCardName(newCard.number)
            let cardSuite = suites[newCard.suite]
            
            // Generate success added card message
            message = "Generated a  of \(cardName) of \(cardSuite)"
        }
    }
    
    func drawCard() {
        // Check if no cards in deck
        if deck.count == 0 {
            message = "No cards in the deck."
        } else {
            // Get random card instance
            let randomCardIndex = Int.random(in: 0..<deck.count)
            let randomCard = deck[randomCardIndex]
            
            // Remove radnome card from array
            deck.remove(at: randomCardIndex)
            
            // Get random card name and suite
            let cardName = getCardName(randomCard.number)
            let cardSuite = suites[randomCard.suite]
            
            // Generate message of drawed card
            message = "Drew a \(cardName) of \(cardSuite)"
        }
    }
    
    // Change names of cards and return it in string value
    func getCardName(_ cardNumber: Int) -> String {
        if cardNumber == 1 {
            return "Ace"
        } else if cardNumber == 11 {
            return "Jeck"
        } else if cardNumber == 12 {
            return "Queen"
        } else if cardNumber == 13 {
            return "King"
        } else {
            return String(cardNumber)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
