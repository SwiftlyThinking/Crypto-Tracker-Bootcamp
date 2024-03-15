//
//  HomeViewModel.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 15.03.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        allCoins.append(DeveloperPreview.shared.coin)
        portfolioCoins.append(DeveloperPreview.shared.coin)
    }
    
}
