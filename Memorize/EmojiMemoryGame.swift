//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeremy Koo on 9/12/23.
//

// ViewModel
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
}


//    let emojiThemes = [
//        ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"],
//        ["🚗", "🚕", "🏎️", "🚔", "🚑", "🚜", "🚲", "✈️", "🚀", "🚁", "⛵️", "🛸"],
//        ["🐶", "🐱", "🐰", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐷", "🐵", "🐸"]
//    ]
