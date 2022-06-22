//
//  ContentView.swift
//  SwiftUIFoo
//
//  Created by Thrace on 4/24/22.
//

import SwiftUI

let size: CGFloat = 150
let fontSize: CGFloat = 20

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image("baghead2").resizable().scaledToFit().frame(height: size)
                VStack{
                Label("BagHead FTW", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/).font(.body)
                    Text("Bottoms Up!").font(Font.custom("PROMETHEUS", size: fontSize))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
