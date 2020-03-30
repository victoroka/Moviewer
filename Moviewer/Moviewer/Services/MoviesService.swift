//
//  MoviesService.swift
//  Moviewer
//
//  Created by Victor Oka on 18/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class MoviesService {
    
    static let shared = MoviesService()
    let session: URLSession = URLSession(configuration: .default)
    
    func fetchMovies(_ endpoint: Endpoint, completion: @escaping (Result<MovieList, NetworkError>) -> Void) {
        
        guard let url = endpoint.url else {
            completion(.failure(.badUrl))
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if data == nil {
                completion(.failure(.emptyResponseDataError))
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            if 200...299 ~= statusCode {
                do {
                    let decodedMovieList = try JSONDecoder().decode(MovieList.self, from: data!)
                    completion(.success(decodedMovieList))
                } catch {
                    completion(.failure(.mappingError))
                }
            }
            completion(.failure(NetworkHelper.getErrorDescription(for: statusCode)))
        })
        task.resume()
    }
    
}
