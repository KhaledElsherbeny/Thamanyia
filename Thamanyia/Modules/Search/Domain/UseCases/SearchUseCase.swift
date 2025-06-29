//
//  HomeUseCase.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine

protocol SearchUseCaseProtocol {
    func search(with query: String) async throws -> [SearchResultSectionModel]
}

class SearchUseCase: SearchUseCaseProtocol {
    private let searchRepository: SearchRepositoryProtocol

    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }

    func search(with query: String) async throws -> [SearchResultSectionModel] {
        return try await searchRepository.search(with: query).sections ?? []
    }
}
