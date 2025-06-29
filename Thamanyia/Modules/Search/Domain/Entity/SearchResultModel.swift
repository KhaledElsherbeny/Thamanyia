//
//  SearchResultModel.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import Foundation

struct SearchResultModel {
    let sections: [SearchResultSectionModel]?
}

struct SearchResultSectionModel {
    let name: String?
    let type: String?
    let contentType: String?
    let order: Int?
    let content: [SearchResultContentModel]?
}

struct SearchResultContentModel {
    let podcastID: String?
    let name: String?
    let description: String?
    let avatarURL: String?
    let episodeCount: Int?
    let duration: Int?
    let language: String?
    let priority: Int?
    let popularityScore: Double?
    let score: Double?
}


extension SearchResultModel {
    init(dto: SearchResultDTO) {
        self.sections = dto.sections.map { $0.toDomain() }
    }
}

extension SearchResultSectionModel {
    init(dto: SearchResultSectionDTO) {
        self.name = dto.name
        self.type = dto.type
        self.contentType = dto.contentType
        self.order = Int(dto.order)
        self.content = dto.content.map { $0.toDomain() }
    }
}

extension SearchResultContentModel {
    init(dto: SearchResultContent) {
        self.podcastID = dto.podcastID
        self.name = dto.name
        self.description = dto.description
        self.avatarURL = dto.avatarURL
        self.episodeCount = Int(dto.episodeCount)
        self.duration = Int(dto.duration)
        self.language = dto.language
        self.priority = Int(dto.priority)
        self.popularityScore = Double(dto.popularityScore)
        self.score = Double(dto.score)
    }
}


extension SearchResultDTO: DomainMappable {
    func toDomain() -> SearchResultModel {
        SearchResultModel(dto: self)
    }
}

extension SearchResultSectionDTO: DomainMappable {
    func toDomain() -> SearchResultSectionModel {
        SearchResultSectionModel(dto: self)
    }
}

extension SearchResultContent: DomainMappable {
    func toDomain() -> SearchResultContentModel {
        SearchResultContentModel(dto: self)
    }
}
