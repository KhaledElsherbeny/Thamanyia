//
//  HomeService.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine

protocol HomeServiceProtocol {
    func fetchHomeData(at page: Int) async throws -> HomeDTO
}

final class HomeService: HomeServiceProtocol {
    
    var networkManager: NetworkSendableProtocol = NetworkManager.shared
    
    func fetchHomeData(at page: Int) async throws -> HomeDTO {
        let endpoint = HomeEndpoint.getHome(page: page)
        return try await networkManager.send(model: HomeDTO.self, endpoint: endpoint)
    }
}
