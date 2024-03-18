//
//  PortfolioView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 17.03.2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButtonView()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    trailingNavBarButton
                }
            }
            .onChange(of: vm.searchText) { oldValue, newValue in
                if newValue == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeViewModel())
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(getSelectedColor(coin), lineWidth: 1)
                        )
                }
            }
        }
        .frame(height: 120)
        .padding(.leading)
        .scrollIndicators(.hidden)
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            
            Divider()
            
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            
            HStack {
                Text("Current value: ")
                Spacer()
                Text("\(getCurrentValue().asCurrencyWith2Decimals())")
            }
        }
        .transaction { $0.animation = nil }
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        Button {
            saveButtonPressed()
        } label : {
            Text("Save".uppercased())
                .font(.headline)
        }
        .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0)
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private func getSelectedColor(_ coin: CoinModel) -> Color {
        return selectedCoin?.id == coin.id ? Color.greenCustom : Color.clear
    }
    
    private func saveButtonPressed() {
        guard 
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else { return }
        
        vm.updatePortfolio(coin: coin, amount: amount)
        
        withAnimation(.easeIn) {
            removeSelectedCoin()
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id}),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
}
