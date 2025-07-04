//
//  HorizontalDoubleRowGridView.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//
import Foundation
import SwiftUI

struct HorizontalDoubleRowGridView: View {
    var items: [SectionContent]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: [GridItem(.flexible()), GridItem(.flexible())], // Ensure fixed heights for rows
                spacing: 15
            ) {
                ForEach(items, id: \.id) { item in
                    DoubleLineCardView(item: item)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct DoubleLineCardView: View {
    let item: SectionContent

    var body: some View {
        HStack(spacing: 15) {
            // Image
            if let avatarURL = item.avatarURL {
                AsyncImage(url: URL(string: avatarURL)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("5 hours ago")
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(item.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()
        }
        .padding(10)
        .background(Color("#272937"))
        .cornerRadius(15)
    }
}
