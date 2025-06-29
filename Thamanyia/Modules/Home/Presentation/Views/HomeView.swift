//
//  HomeView.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 0) {
            NavigationView(
                onSearchTapped: {
                    viewModel.onSearchTapped()
                },
                onNotificationTapped: {
                    print("Notification tapped")
                }
            )
            
            List {
                ForEach(viewModel.homeDataSectionList, id: \.id) { section in
                    HomeSectionView(section: section)
                        .listRowBackground(Color.clear)
                        .onAppear {
                            viewModel.fetchMoreSectionsIfNeeded()
                        }
                }
            }
            .listStyle(.plain)
            .background(Color("#141520"))
        }
        .loadingOverlay(viewModel.state == .loading)
        .background(Color("#141520").edgesIgnoringSafeArea(.all))
        .task {
            viewModel.fetchHomeData()
        }
    }
}

struct HomeSectionView: View {
    let section: SectionUIModel

    var body: some View {
        Section(
            header: SectionHeaderView(
                title: section.name ?? "",
                type: section.contentType?.rawValue ?? ""
            )
        ) {
            contentView
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch section.type {
        case .bigSquare, .bigSquareWithDash:
            HorizontalCardListView(items: section.content ?? [])
        case .square:
            EpisodeTileScrollView(items: section.content ?? [])
        case .queue:
            TagListView(items: section.content ?? [])
        case .TwoLinesGrid:
            HorizontalDoubleRowGridView(items: section.content ?? [])
        case .none:
            Text("No display type defined")
                .foregroundColor(.white)
        }
    }
}
