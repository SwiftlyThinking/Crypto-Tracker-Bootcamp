//
//  HomeView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 14.03.2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                
                HomeStatsView(showPortfolio: $showPortfolio)
                
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                }
                
                if showPortfolio {
                    portfolioCoins
                }
                
                Spacer(minLength: 0)
            }
        }
        .sheet(isPresented: $showPortfolioView) {
            PortfolioView()
                .environmentObject(vm)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(HomeViewModel())
    }
    .toolbar(.hidden)
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .transaction { $0.animation = nil }
                .background {
                    CircleButtonAnimationView(animate: $showPortfolio)
                }
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
            
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.accentColor)
                .transaction { $0.animation = nil }
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(.degrees(showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(
                        top: 10,
                        leading: 0,
                        bottom: 10,
                        trailing: 10))
            }
        }
        .listStyle(.plain)
        .transition(.move(edge: .leading))
    }
    
    private var portfolioCoins: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(
                        top: 10,
                        leading: 0,
                        bottom: 10,
                        trailing: 10))
            }
        }
        .listStyle(.plain)
        .transition(.move(edge: .trailing))
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
            Button {
                withAnimation(.linear) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(.degrees(vm.isLoading ? 360 : 0))
        }
        .font(.caption)
        .foregroundStyle(Color.secondaryText)
        .padding(.horizontal)
    }
}
