//
//  GenreList.swift
//  Moviewer
//
//  Created by Victor Oka on 20/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

// MARK: - Codable Protocol
class GenreList: Codable {
    
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
    init(genres: [Genre]) {
        self.genres = genres
    }
}
