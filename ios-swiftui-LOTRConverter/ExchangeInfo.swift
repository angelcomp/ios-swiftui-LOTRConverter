//
//  ExchangeInfo.swift
//  ios-swiftui-LOTRConverter
//
//  Created by Angelica dos Santos on 12/01/23.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")

                    .padding()
                
                ExchangeRate(leftImage: "goldpiece", description: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny")
                
                ExchangeRate(leftImage: "goldpenny", description: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")

                ExchangeRate(leftImage: "silverpiece", description: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
                
                ExchangeRate(leftImage: "silverpenny", description: "1 Silver Penny = 100 Copper Pennies", rightImage: "copperpenny")
                
                Button("Done") {
                    dismiss()
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(10)
                .background(.brown)
                .cornerRadius(15)
            }
            .foregroundColor(.black)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
            .preferredColorScheme(.dark)
    }
}
