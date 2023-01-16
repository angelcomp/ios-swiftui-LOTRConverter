//
//  ExchangeRate.swift
//  ios-swiftui-LOTRConverter
//
//  Created by Angelica dos Santos on 16/01/23.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage: String
    @State var description: String
    @State var rightImage: String
    
    init(leftImage: String, description: String, rightImage: String) {
        self.leftImage = leftImage
        self.description = description
        self.rightImage = rightImage
    }
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(description)
                .font(.system(size: 14))
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", description: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
            .previewLayout(.sizeThatFits)
    }
}
