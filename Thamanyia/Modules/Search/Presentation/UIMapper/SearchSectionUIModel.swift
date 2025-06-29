//
//  SearchSectionUIModel.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import Foundation

struct SearchSectionUIModel {
    let id = UUID().uuidString
    let name: String
    let type: String
    let rows: [SearchRowUIModel]
}

extension SearchSectionUIModel {
    init(from model: SearchResultSectionModel) {
        self.name = model.name ?? ""
        self.type = model.type ?? ""
        self.rows = model.content?.map { SearchRowUIModel(from: $0) } ?? []
    }
}

struct SearchRowUIModel {
    let podcastID: String
    let avatarURL: String?
    let name: String?
    let description: String?
}

extension SearchRowUIModel {
    init(from model: SearchResultContentModel) {
        self.podcastID = model.podcastID ?? UUID().uuidString
        self.name = model.name
        self.description = model.description
        self.avatarURL = model.avatarURL
    }
}
