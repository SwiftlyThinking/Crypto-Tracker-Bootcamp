//
//  PortfolioDataService.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 18.03.2024.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entity: String = "PortfolioEntity"
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error.localizedDescription)")
            }
            
            self.getPortfolio()
        }
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add (coin: coin, amount: amount)
        }
    }
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entity)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Porfolio Entities. \(error.localizedDescription)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error.localizedDescription)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
