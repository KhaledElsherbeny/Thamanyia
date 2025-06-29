//
//  SearchView.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(viewModel.searchResults, id: \.id) { section in
                    Section(header: Text(section.name).foregroundColor(.white)) {
                        ForEach(section.rows, id: \.podcastID) { row in
                            SearchListRowView(model: row)
                                .listRowBackground(Color.clear)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .background(Color("#141520"))
        }
        .searchable(text: $viewModel.searchText, prompt: "Search...")
        .background(Color("#141520").edgesIgnoringSafeArea(.all))
    }
}

struct SearchListRowView: View {
    let model: SearchRowUIModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Circular Image
            AsyncImage(url: URL(string: model.avatarURL ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
            
            // Name & Description
            VStack(alignment: .leading, spacing: 4) {
                Text(model.name ?? "")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(model.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
