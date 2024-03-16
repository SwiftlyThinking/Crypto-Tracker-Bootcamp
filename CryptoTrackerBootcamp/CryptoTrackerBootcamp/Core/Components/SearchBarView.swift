//
//  SearchBarView.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 16.03.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @FocusState private var focused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.secondaryText : Color.accentColor
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .focused($focused)
                .foregroundStyle(Color.accentColor)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(Color.accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            focused = false
                        }
                    
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.background)
                .shadow(color: Color.accentColor.opacity(0.15),
                        radius: 10, x: 0.0, y: 0.0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
