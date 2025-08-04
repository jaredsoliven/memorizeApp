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
 */

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻", "🎃", "🍬", "😈", "💀", "🧙", "😀", "😔", "🏀", "🎾", "🎳", "💧"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemove
            Spacer()
            cardAdd
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemove: some View {
        return cardCountAdjuster(by: -1, symbol : "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdd: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

/**
 Struct that holds properties of the card view
 */
struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false // explicitly defining var type
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // let == constant in swift
            // no need to explicitly define type for variables/constants (type inferencing)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture { // unable to mutate variables in view, need to change state vars (pointer vars)
            //print("tapped")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
