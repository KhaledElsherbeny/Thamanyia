//
//  TagListView.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation
import SwiftUI

struct TagListView: View {
    var items: [SectionContent] // Array of item titles

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items, id: \.id) { item in
                    Text(item.name ?? "")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 15)
        }
    }
}
