//
//  NetworkError.swift
//  Moviewer
//
//  Created by Victor Oka on 18/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case notFound
    case forbidden
    case unauthorized
    case badUrl
    case mappingError
    case emptyResponseDataError
    case unknownError
}
