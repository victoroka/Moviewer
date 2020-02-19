//
//  MoviesList.swift
//  Moviewer
//
//  Created by Victor Oka on 19/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class MoviesList: ObservableObject {
    
    @Published var list: MovieList = MovieList(movies: [])
    @Published var isLoading: Bool = false
    
    var moviesService = MoviesService.shared
    
    func reload() {
        self.list = MovieList(movies: [])
        self.isLoading = true
        
        moviesService.fetchMovies(Endpoint.buildUpcomingMoviesURL()) { [weak self] (result) in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.list = movies
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
