//
//  Date.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 19.03.2024.
//

import Foundation

extension Date {
    
    init(coinString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    /// Formats the date into a short date
    /// ```
    /// 2023-01-16T00:10:00-0600 -> 01/16/2023
    /// ```
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    /// Formats the date into a short date string
    /// ```
    /// 01/16/2023 -> "01/16/2023"
    /// ```
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
