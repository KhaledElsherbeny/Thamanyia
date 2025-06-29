//
//  HomeEndpoint.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation

enum HomeEndpoint: BaseEndpoint {
    case getHome(page: Int)

    var path: String {
        switch self {
        case .getHome:
            return "home_sections"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getHome:
            return .get
        }
    }

    var parameters: Parameters {
        switch self {
        case let .getHome(page):
            return ["page": page]
        }
    }
}
