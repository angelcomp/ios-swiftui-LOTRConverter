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
    @State private var showSelectCurrency = false
    @State private var showExchangeInfo = false
    @State private var leftTyping = false
    @State private var rightTyping = false
    @State private var leftAmountTemp = ""
    @State private var rightAmountTemp = ""
    
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
                        .padding(.bottom, -5).onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        TextField("Amount", text: $leftAmount, onEditingChanged: { typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                        .padding(7)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(7)
                        .keyboardType(.decimalPad)
                        .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
                            rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                        }
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
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                        .padding(7)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(7)
                        .keyboardType(.decimalPad)
                        .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
                            leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                        }
                        .onChange(of: rightCurrency) { _ in
                            rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                        }
                    }
                }
                .padding(32)
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding([.trailing, .bottom])
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
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
