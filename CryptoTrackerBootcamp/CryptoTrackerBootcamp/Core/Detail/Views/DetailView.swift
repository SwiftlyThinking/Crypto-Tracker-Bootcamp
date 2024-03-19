//
//  DetailView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 18.03.2024.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        Text(vm.coinDetails?.hashingAlgorithm ?? "")
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.shared.coin)
}
