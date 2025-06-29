//
//  LoaderView.swift
//  Thamanyia
//
//  Created by Khalid on 27/06/2025.
//

import SwiftUI

struct LoadingOverlayModifier: ViewModifier {
    let isPresented: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
            }
        }
    }
}

extension View {
    func loadingOverlay(_ isPresented: Bool) -> some View {
        self.modifier(LoadingOverlayModifier(isPresented: isPresented))
    }
}
