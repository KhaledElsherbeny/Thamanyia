//
//  SearchRepository.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation

final class SearchRepository: SearchRepositoryProtocol {
    private let searchService: SearchServiceProtocol

    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
    }

    func search(with query: String) async throws -> SearchResultModel {
        do {
            let dto = try await searchService.search(with: query)
            return SearchResultModel(dto: dto)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.connectionFailed
        }
    }
}
