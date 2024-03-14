//
//  CircleButtonView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 14.03.2024.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.background)
            )
            .shadow(
                color: Color.accentColor.opacity(0.25),
                radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "info")
}
