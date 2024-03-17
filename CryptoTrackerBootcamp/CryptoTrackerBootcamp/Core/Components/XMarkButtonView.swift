//
//  XMarkButtonView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 17.03.2024.
//

import SwiftUI

struct XMarkButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

#Preview {
    XMarkButtonView()
}
