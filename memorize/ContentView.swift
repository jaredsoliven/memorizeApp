//
//  ContentView.swift
//  memorize
//
//  Created by Jared SJ on 8/4/25.
//

/**
 - : view == behaves like a
 - :
 */

import SwiftUI

struct ContentView: View {
    
    
    // var body == computed property (entire var body variable)
    // computed == bracketed area, area is computed everytime that area is called
    // regular property == regular variables
    // "some" allows anything to be a view as long as it can return as a view
    // vstack and hstacks
    // var i: Int // var [name] : type
    // var s: String
    // struct: basically a property that can have sub properties, ex) image property with imageScale property
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}
