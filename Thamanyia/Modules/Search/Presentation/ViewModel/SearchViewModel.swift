//
//  SearchViewModel.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine
import Foundation

final class SearchViewModel: ObservableObject {
    // MARK: - Inputs
    @Published var searchText: String = ""
    
    // MARK: - Outputs
    @Published var searchResults: [SearchSectionUIModel] = []
    @Published private(set) var state: ViewState = .idle

    private let coordinator: HomeCoordinatorProtocol?
    private let searchUseCase: SearchUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(searchUseCase: SearchUseCaseProtocol, coordinator: HomeCoordinatorProtocol? = nil) {
        self.searchUseCase = searchUseCase
        self.coordinator = coordinator
        setupSearchPipeline()
    }

    private func setupSearchPipeline() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .sink { [weak self] query in
                guard let self = self else { return }
                self.state = .loading
                Task {
                    do {
                        let results = try await self.searchUseCase.search(with: query)
                        await MainActor.run {
                            self.searchResults = results.map({ SearchSectionUIModel(from: $0) })
                            self.state = .idle
                        }
                    } catch {
                        await MainActor.run {
                            self.searchResults = []
                            self.state = .error(error.localizedDescription)
                        }
                    }
                }
            }
            .store(in: &cancellables)
    }
}
