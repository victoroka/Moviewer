//
//  ImagePath.swift
//  Moviewer
//
//  Created by Victor Oka on 19/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class ImagePath {
    
    let path: String
    
    // MARK: - Base image URL components
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "image.tmdb.org"
        components.path = path
        return components.url
    }
    
    // MARK: - Build image URL to fetch the movie banner
    static func buildImagePath(withSize size: String = "400", for path: String) -> ImagePath {
        ImagePath(path: "/t/p/w\(size)\(path)")
    }
    
    init(path: String) {
        self.path = path
    }
}
