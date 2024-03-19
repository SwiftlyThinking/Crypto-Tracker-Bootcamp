//
//  SettingsView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 19.03.2024.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let githubURL = URL(string: "https://github.com/SwiftlyThinking")!
    let instagramURL = URL(string: "https://www.instagram.com/mykyta_kuzminov/?next=/")!
    
    var body: some View {
        NavigationStack {
            List {
                cryptoTrackerSection
                coinGeckoSection
                applicationSection
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.grouped)
            .tint(Color.blue)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButtonView()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var cryptoTrackerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                
                Text("This app was developed by Mykyta Kuzminov. It uses SwiftUI and is written 100% in Swift. It uses MVVM Architecture, Combine and CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.accent)
            }
            .padding(.vertical)
            Link("GitHub 🤩", destination: githubURL)
            Link("Instagram 🥰", destination: instagramURL)
        } header: {
            Text("Crypto Tracker")
        }
    }
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .frame(height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        } header: {
            Text("CoinGecko")
        }
    }
    private var applicationSection: some View {
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        } header: {
            Text("Developer")
        }
    }
}
