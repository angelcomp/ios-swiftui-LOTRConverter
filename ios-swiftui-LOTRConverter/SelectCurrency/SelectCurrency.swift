//
//  SelectCurrency.swift
//  ios-swiftui-LOTRConverter
//
//  Created by Angelica dos Santos on 16/01/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $leftCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $rightCurrency)
                
                Button("Done") {
                    dismiss()
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(10)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPenny), rightCurrency: .constant(.goldPiece))
    }
}
