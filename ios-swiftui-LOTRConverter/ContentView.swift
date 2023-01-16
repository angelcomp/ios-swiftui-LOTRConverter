//
//  ContentView.swift
//  ios-swiftui-LOTRConverter
//
//  Created by Angelica dos Santos on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    @State private var leftCurrency: Currency = .goldPiece
    @State private var rightCurrency: Currency = .silverPenny
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(
                                CurrencyImage.allCases[
                                    Currency.allCases.firstIndex(of: leftCurrency)!
                                ].rawValue
                            )
                            .resizable()
                            .scaledToFit()
                            .frame(height: 33)
                            
                            Text(
                                CurrencyText.allCases[
                                    Currency.allCases.firstIndex(of: leftCurrency)!
                                ].rawValue
                            )
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding(.bottom, -5)
                        
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    VStack {
                        HStack {
                            Text(
                                CurrencyText.allCases[
                                    Currency.allCases.firstIndex(of: rightCurrency)!
                                ].rawValue
                            )
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            Image(
                                CurrencyImage.allCases[
                                    Currency.allCases.firstIndex(of: rightCurrency)!
                                ].rawValue
                            )
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        
                        TextField("Amount", text: $rightAmount)
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                }
                .padding(.trailing)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
