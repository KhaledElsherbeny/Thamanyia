//
//  UIApplication+ActiveWindow.swift
//  Thamanyia
//
//  Created by Khalid on 27/06/2025.
//

import UIKit

extension UIApplication {
    // Get the active window in iOS 15+ in a reusable way
    var activeWindow: UIWindow? {
        return connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
