//
//  GenresList.swift
//  Moviewer
//
//  Created by Victor Oka on 20/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class GenresList: ObservableObject {
    
    @Published var list: GenreList = GenreList(genres: [])
    @Published var hasAlreadyLoaded: Bool = false
    
    var genresService = GenresService.shared
    
    func reload() {
        self.list = GenreList(genres: [])
        
        genresService.fetchGenres(Endpoint.buildMovieGenresURL()) { [weak self] (result) in
            switch result {
            case .success(let genres):
                DispatchQueue.main.async {
                    self?.hasAlreadyLoaded = true
                    self?.list = genres
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
