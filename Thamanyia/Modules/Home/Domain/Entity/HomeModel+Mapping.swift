//
//  HomeModel+Mapping.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import Foundation

extension HomeModel {
    init(dto: HomeDTO) {
        self.sections = dto.sections?.map { $0.toDomain() }
        self.pagination = dto.pagination?.toDomain()
    }
}

extension PaginationModel {
    init(dto: PaginationDTO) {
        self.nextPage = dto.nextPage
        self.totalPages = dto.totalPages
    }
}

extension SectionModel {
    init(dto: SectionDTO) {
        self.name = dto.name
        self.type = dto.type
        self.contentType = dto.contentType
        self.order = dto.order
        self.content = dto.content?.map { $0.toDomain() }
    }
}

extension ContentModel {
    init(dto: ContentDTO) {
        self.podcastID = dto.podcastID
        self.name = dto.name
        self.description = dto.description
        self.avatarURL = dto.avatarURL
        self.episodeCount = dto.episodeCount
        self.duration = dto.duration
        self.language = dto.language
        self.priority = dto.priority
        self.popularityScore = dto.popularityScore
        self.score = dto.score
        self.podcastPopularityScore = dto.podcastPopularityScore
        self.podcastPriority = dto.podcastPriority
        self.episodeID = dto.episodeID
        self.seasonNumber = dto.seasonNumber
        self.episodeType = dto.episodeType
        self.podcastName = dto.podcastName
        self.authorName = dto.authorName
        self.number = dto.number
        self.separatedAudioURL = dto.separatedAudioURL
        self.audioURL = dto.audioURL
        self.releaseDate = dto.releaseDate
        self.chapters = dto.chapters
        self.paidIsEarlyAccess = dto.paidIsEarlyAccess
        self.paidIsNowEarlyAccess = dto.paidIsNowEarlyAccess
        self.paidIsExclusive = dto.paidIsExclusive
        self.paidTranscriptURL = dto.paidTranscriptURL
        self.freeTranscriptURL = dto.freeTranscriptURL
        self.paidIsExclusivePartially = dto.paidIsExclusivePartially
        self.paidExclusiveStartTime = dto.paidExclusiveStartTime
        self.paidEarlyAccessDate = dto.paidEarlyAccessDate
        self.paidEarlyAccessAudioURL = dto.paidEarlyAccessAudioURL
        self.paidExclusivityType = dto.paidExclusivityType
        self.audiobookID = dto.audiobookID
        self.articleID = dto.articleID
    }
}


extension HomeDTO: DomainMappable {
    func toDomain() -> HomeModel {
        HomeModel(dto: self)
    }
}

extension PaginationDTO: DomainMappable {
    func toDomain() -> PaginationModel {
        PaginationModel(dto: self)
    }
}

extension SectionDTO: DomainMappable {
    func toDomain() -> SectionModel {
        SectionModel(dto: self)
    }
}

extension ContentDTO: DomainMappable {
    func toDomain() -> ContentModel {
        ContentModel(dto: self)
    }
}
