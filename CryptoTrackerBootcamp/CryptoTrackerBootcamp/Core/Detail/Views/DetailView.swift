//
//  DetailView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 18.03.2024.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.shared.coin)
}
