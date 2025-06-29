//
//  NavigationView.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation
import SwiftUI

struct NavigationView: View {
    var onSearchTapped: () -> Void
    var onNotificationTapped: () -> Void

    var body: some View {
        HStack {
            // Profile Icon
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)

            // Greeting Text and Icon
            HStack {
                Text("Good morning Abdelrahman")
                    .foregroundColor(.white)
                    .font(.headline)
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.yellow)
            }

            Spacer()

            // Search Icon
            Button(action: {
                onSearchTapped()
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.white)
                    .padding(.trailing, 12)
            }

            // Notification Icon with Badge
            Button(action: {
                onNotificationTapped()
            }) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)

                    // Red Badge
                    Text("4")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Circle().foregroundColor(.red))
                        .offset(x: 10, y: -10)
                }
            }
        }
        .padding()
        .background(Color("#141520"))
    }
}
