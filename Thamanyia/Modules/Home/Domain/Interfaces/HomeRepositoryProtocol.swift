//
//  HomeRepositoryProtocol.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine

protocol HomeRepositoryProtocol {
    func fetchHome(at page: Int) async throws -> HomeModel
}
