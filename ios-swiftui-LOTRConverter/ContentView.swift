//
//  ContentView.swift
//  ios-swiftui-LOTRConverter
//
//  Created by Angelica dos Santos on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Angelica!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
