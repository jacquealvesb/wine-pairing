//
//  FeedbackManager.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 21/01/21.
//

import UIKit

final class FeedbackManager {
    static func error() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
    
    static func success() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    static func button() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
}
