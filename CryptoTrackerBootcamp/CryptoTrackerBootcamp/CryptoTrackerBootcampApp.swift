//
//  CryptoTrackerBootcampApp.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 14.03.2024.
//

import SwiftUI

@main
struct CryptoTrackerBootcampApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .toolbar(.hidden)
            .environmentObject(vm)
        }
    }
}
