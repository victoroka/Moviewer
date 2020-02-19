//
//  MoviesService.swift
//  Moviewer
//
//  Created by Victor Oka on 18/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class MoviesService {
    
    // TODO: fetchMovies function
    
    func getErrorDescription(for statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        default:
            return .unknownError
        }
    }
    
}
