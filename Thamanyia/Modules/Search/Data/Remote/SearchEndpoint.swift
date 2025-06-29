//
//  HomeEndpoint.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation

enum SearchEndpoint: BaseEndpoint {
    case search(query: String)

    var baseUrl: URL {
        guard let url = URL(string: APIConstants.seachBaseUrl) else {
            fatalError("Invalid Base URL, please check base URL.")
        }
        return url
    }

    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }

    var parameters: Parameters {
        switch self {
        case let .search(query):
            return ["q": query]
        }
    }
}
