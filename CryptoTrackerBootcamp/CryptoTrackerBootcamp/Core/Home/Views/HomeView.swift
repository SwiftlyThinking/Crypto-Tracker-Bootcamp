//
//  HomeView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 14.03.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
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
}
