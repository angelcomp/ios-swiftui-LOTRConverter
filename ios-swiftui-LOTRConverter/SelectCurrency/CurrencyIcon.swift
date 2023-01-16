//
//  CurrencyIcon.swift
//  ios-swiftui-LOTRConverter
//
//  Created by Angelica dos Santos on 16/01/23.
//

import SwiftUI

struct CurrencyIcon: View {
    
    @State var image: String
    @State var caption: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                
                Text(caption)
                    .padding(3)
                    .font(.caption)
                    .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(image: "goldpiece", caption: "Gold Piece")
            .previewLayout(.sizeThatFits)
    }
}
