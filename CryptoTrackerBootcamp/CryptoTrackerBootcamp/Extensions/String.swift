//
//  String.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 19.03.2024.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
