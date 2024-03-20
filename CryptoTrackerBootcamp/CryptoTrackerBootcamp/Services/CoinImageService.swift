//
//  CoinImageService.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 16.03.2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private let fileManager = LocalFileManager.shared
    
    private let coin: CoinModel
    private let imageName: String
    private let folderName: String = "CoinImages"
    
    private var imageSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage =  fileManager.getImage(folderName: folderName, imageName: imageName) {
            image = savedImage
        } else {
            downloadCoinImage(coin: coin)
        }
    }
    
    private func downloadCoinImage(coin: CoinModel) {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard 
                    let self = self,
                    let downloadedImage = returnedImage
                else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, folderName: folderName, imageName: imageName)
            })
    }
}
