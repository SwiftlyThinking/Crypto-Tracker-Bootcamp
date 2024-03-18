//
//  HapticManager.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 18.03.2024.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
