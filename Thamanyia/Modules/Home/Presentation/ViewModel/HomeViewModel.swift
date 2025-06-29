//
//  HomeViewModel.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinatorProtocol?
    private let homeUseCase: HomeUseCaseProtocol
    
    @Published var homeDataSectionList: [SectionUIModel] = []
    @Published private(set) var state: ViewState = .idle
    
    
    init(
        homeUseCase: HomeUseCaseProtocol,
        coordinator: HomeCoordinatorProtocol? = nil
    ) {
        self.homeUseCase = homeUseCase
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    
    func fetchHomeData() {
        guard state != .loading else {
            return
        }
        
        state = .loading
        
        Task {
            do {
                let sections = try await homeUseCase.fetchHome()
                let mapped = sections.map { SectionUIModel(from: $0) }
                await MainActor.run {
                    homeDataSectionList.append(contentsOf: mapped)
                    state = .idle
                }
            } catch {
                await MainActor.run {
                    state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchMoreSectionsIfNeeded() {
        guard homeUseCase.hasMoreSections else { return }
        fetchHomeData()
    }
    
    func resetPagination() async {
        homeUseCase.resetPagination()
        homeDataSectionList.removeAll()
        fetchHomeData()
    }
}

extension HomeViewModel {
    func onSearchTapped() {
        coordinator?.showSearch()
    }
}
