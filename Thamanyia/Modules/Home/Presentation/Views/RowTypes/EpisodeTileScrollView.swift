//
//  EpisodeTileScrollView.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation
import SwiftUI

struct EpisodeTileScrollView: View {
    var items: [SectionContent]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 6) {
                        if let avatarURL = item.avatarURL, let url = URL(string: avatarURL) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 120, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                        Text("\(item.name ?? "") episodes")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    .frame(width: 120)
                }
            }
            .padding(.horizontal)
        }
    }
}
