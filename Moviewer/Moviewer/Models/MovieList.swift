//
//  MovieList.swift
//  Moviewer
//
//  Created by Victor Oka on 19/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

// MARK: - Codable Protocol
class MovieList: Codable {
    
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}
