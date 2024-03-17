//
//  StatisticView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 17.03.2024.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.accentColor)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(.degrees(
                        (stat.percentageChange ?? 0) >= 0 ? 0 : 180)
                    )
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundStyle(
                (stat.percentageChange ?? 0) >= 0 ?
                Color.greenCustom : Color.redCustom
            )
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}

#Preview {
    StatisticView(stat: DeveloperPreview.shared.statistic)
}
