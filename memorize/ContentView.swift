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

/**
 Struct that holds properties of the card view
 */
struct CardView: View {
    @State var isFaceUp: Bool = false // explicitly defining var type
    var body: some View {
        ZStack {
            let base = Circle() // let == constant in swift
            // no need to explicitly define type for variables/constants (type inferencing)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
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
