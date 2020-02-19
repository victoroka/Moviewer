//
//  Endpoint.swift
//  Moviewer
//
//  Created by Victor Oka on 18/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

struct Endpoint {
    
    let path: String
    let queryItems: [URLQueryItem]
    
    // MARK: - Base URL components
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    // MARK: - Build URL to fetch upcoming movies
    static func buildUpcomingMoviesURL(language: String = "en-US", page: String = "1") -> Endpoint {
        Endpoint(
            path: "/3/movie/upcoming",
            queryItems: [
                URLQueryItem(name: "api_key", value: "\(Constants.API_KEY)"),
                URLQueryItem(name: "language", value: "\(language)"),
                URLQueryItem(name: "page", value: "\(page)")
        ])
    }
    
}
