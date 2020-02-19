//
//  Movie.swift
//  Moviewer
//
//  Created by Victor Oka on 19/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

// MARK: - Codable Protocol
class Movie: Codable {
    
    let id: Int
    let title: String
    let originalTitle: String
    let originalLanguage: String
    let overview: String
    let releaseDate: String
    let genres: [Int]
    let posterPath: String?
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double
    let hasVideo: Bool
    let isAdult: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case overview = "overview"
        case releaseDate = "release_date"
        case genres = "genre_ids"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case hasVideo = "video"
        case isAdult = "adult"
    }
    
    init(id: Int, title: String, originalTitle: String, originalLanguage: String, overview: String, releaseDate: String, genres: [Int], posterPath: String, backdropPath: String, popularity: Double, voteCount: Int, voteAverage: Double, hasVideo: Bool, isAdult: Bool) {
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.originalLanguage = originalLanguage
        self.overview = overview
        self.releaseDate = releaseDate
        self.genres = genres
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.popularity = popularity
        self.voteCount = voteCount
        self.voteAverage = voteAverage
        self.hasVideo = hasVideo
        self.isAdult = isAdult
    }
}

// MARK: - Identifiable Protocol
extension Movie: Identifiable {}
