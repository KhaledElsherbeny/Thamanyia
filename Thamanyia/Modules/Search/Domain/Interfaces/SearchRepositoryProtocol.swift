//
//  SearchRepositoryProtocol.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Combine

protocol SearchRepositoryProtocol {
    func search(with query: String) async throws -> SearchResultModel
}
