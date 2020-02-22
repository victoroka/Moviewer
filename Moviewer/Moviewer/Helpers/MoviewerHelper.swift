//
//  MoviewerHelper.swift
//  Moviewer
//
//  Created by Victor Oka on 20/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class MoviewerHelper {
    
    static func getGenresLabel(for ids: [Int], list: GenreList) -> String {
        
        var genresLabel: String = ""
        for genre in list.genres {
            if ids.contains(genre.id) {
                genresLabel += "\(genre.name) | "
            }
        }
        
        let offsetIndex = genresLabel.count-3
        return genresLabel[0...offsetIndex]
        
    }
    
}
