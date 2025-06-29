//
//  SearchService.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine

protocol SearchServiceProtocol {
    func search(with query: String) async throws -> SearchResultDTO
}

final class SearchService: SearchServiceProtocol {
    
    var networkManager: NetworkSendableProtocol = NetworkManager.shared
    
    func search(with query: String) async throws -> SearchResultDTO {
    let endpoint = SearchEndpoint.search(query: query)
        return try await networkManager.send(model: SearchResultDTO.self, endpoint: endpoint)
    }
}
