//
//  DetailViewModel.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 19.03.2024.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var coinDetails: CoinDetailModel?
    
    private let coinDetailService: CoinDetailDataService?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService?.$coinDetails
            .sink { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
            }
            .store(in: &cancellables)
    }
}
