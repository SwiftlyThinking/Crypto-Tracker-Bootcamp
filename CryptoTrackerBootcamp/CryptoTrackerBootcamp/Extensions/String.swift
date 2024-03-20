//
//  String.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 19.03.2024.
//

import Foundation

extension String {
    
    /// Remove HTML tags from a string
    /// ```
    /// "<p>This is <b>bold</b>.</p>" -> "This is bold."
    /// ```
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
