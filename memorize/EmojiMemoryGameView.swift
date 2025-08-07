//
//  ContentView.swift
//  memorize
//
//  Created by Jared SJ on 8/4/25.
//

/**
 - : view == behaves like a
 
 // var body == computed property (entire var body variable)
 // computed == bracketed area, area is computed everytime that area is called
 // regular property == regular variables
 // "some" allows anything to be a view as long as it can return as a view
 // vstack and hstacks
 // var i: Int // var [name] : type
 // var s: String
 // struct: basically a property that can have sub properties, ex) image property with imageScale property
 
 model -> view model -> view (read only, view updates based on updates in models)
 view -> (intent) view model -> model
 - (any changes in view model are updated in model)
 - (view model looks for changes in view with intent)
 */

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}

/**
 Struct that holds properties of the card view
 */
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // let == constant in swift
            // no need to explicitly define type for variables/constants (type inferencing)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
