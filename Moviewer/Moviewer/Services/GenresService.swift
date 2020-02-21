//
//  GenresService.swift
//  Moviewer
//
//  Created by Victor Oka on 20/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class GenresService {
    
    static let shared = GenresService()
    let session: URLSession = URLSession(configuration: .default)
    
    func fetchGenres(_ endpoint: Endpoint, completion: @escaping (Result<GenreList, NetworkError>) -> Void) {
        
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
                    let decodedGenreList = try JSONDecoder().decode(GenreList.self, from: data!)
                    completion(.success(decodedGenreList))
                } catch {
                    completion(.failure(.mappingError))
                }
            }
            completion(.failure(NetworkHelper.getErrorDescription(for: statusCode)))
        })
        task.resume()
    }
}
