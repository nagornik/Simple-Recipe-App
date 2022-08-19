//
//  HapticFeedback.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 19.08.2022.
//

import Foundation
import SwiftUI

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator()
        .notificationOccurred(type)
}

func impact(type: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: type)
        .impactOccurred()
}
