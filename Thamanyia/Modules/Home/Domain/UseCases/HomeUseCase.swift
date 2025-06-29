//
//  HomeUseCase.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine

protocol HomeUseCaseProtocol {
    var hasMoreSections: Bool { get }

    func fetchHome() async throws -> [SectionModel]
    func resetPagination()
}

class HomeUseCase: HomeUseCaseProtocol {
    private let homeRepository: HomeRepositoryProtocol

    private var currentPage = 1
    private var totalPages = 0
    private var isFetching = false

    var hasMoreSections: Bool {
        currentPage < totalPages
    }

    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }

    func fetchHome() async throws -> [SectionModel] {
        // Prevent over-fetching
        guard !isFetching, currentPage <= totalPages || totalPages == 0 else {
            return []
        }

        isFetching = true
        defer { isFetching = false }

        let homeData = try await homeRepository.fetchHome(at: currentPage)

        totalPages = homeData.pagination?.totalPages ?? 0
        currentPage += 1

        return homeData.sections ?? []
    }

    func resetPagination() {
        currentPage = 1
        totalPages = 0
        isFetching = false
    }
}
