//
//  HomeRepository.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    private let homeService: HomeServiceProtocol

    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
    }

    func fetchHome(at page: Int) async throws -> HomeModel {
        do {
            let dto = try await homeService.fetchHomeData(at: page)
            return HomeModel(dto: dto)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.connectionFailed
        }
    }
}
