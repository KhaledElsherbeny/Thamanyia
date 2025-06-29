//
//  HomeSectionUIModel+Mapper.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import Foundation

extension SectionUIModel {
    init(from section: SectionModel) {
        self.name = section.name
        self.contentType = ContentTypeEnum(raw: section.contentType)
        self.type = DisplayTypeEnum(raw: section.type)
        self.order = section.order
        self.content = section.content?.map { SectionContent(from: $0) }
    }
}

extension SectionContent {
    init(from model: ContentModel) {
        self.podcastID = model.podcastID
        self.name = model.name
        self.description = model.description
        self.avatarURL = model.avatarURL
        self.episodeCount = model.episodeCount
        self.duration = model.duration
        self.language = model.language
        self.priority = model.priority
        self.popularityScore = model.popularityScore
        self.score = model.score
        self.podcastPopularityScore = model.podcastPopularityScore
        self.podcastPriority = model.podcastPriority
        self.episodeID = model.episodeID
        self.seasonNumber = model.seasonNumber
        self.episodeType = model.episodeType
        self.podcastName = model.podcastName
        self.authorName = model.authorName
        self.number = model.number
        self.separatedAudioURL = model.separatedAudioURL
        self.audioURL = model.audioURL
        self.releaseDate = model.releaseDate
        self.chapters = model.chapters
        self.paidIsEarlyAccess = model.paidIsEarlyAccess
        self.paidIsNowEarlyAccess = model.paidIsNowEarlyAccess
        self.paidIsExclusive = model.paidIsExclusive
        self.paidTranscriptURL = model.paidTranscriptURL
        self.freeTranscriptURL = model.freeTranscriptURL
        self.paidIsExclusivePartially = model.paidIsExclusivePartially
        self.paidExclusiveStartTime = model.paidExclusiveStartTime
        self.paidEarlyAccessDate = model.paidEarlyAccessDate
        self.paidEarlyAccessAudioURL = model.paidEarlyAccessAudioURL
        self.paidExclusivityType = model.paidExclusivityType
        self.audiobookID = model.audiobookID
        self.articleID = model.articleID
    }
}
