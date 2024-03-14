//
//  CircleButtonAnimationView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 14.03.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeInOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
