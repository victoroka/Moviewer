//
//  MovieListView.swift
//  Moviewer
//
//  Created by Victor Oka on 19/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var moviesList: MoviesList = MoviesList()
    @ObservedObject var genresList: GenresList = GenresList()
    
    var body: some View {
        NavigationView {
            Group {
                if moviesList.isLoading {
                    Text("loading...")
                } else {
                    List(self.moviesList.list.movies ?? [], id: \.id) { movie in
                        MovieRowView(movie: movie, genreList: self.genresList.list)
                    }
                }
            }
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            if !self.genresList.hasAlreadyLoaded {
                self.genresList.reload()
            }
            
            if let moviesArray = self.moviesList.list.movies {
                if moviesArray.isEmpty {
                    self.moviesList.reload()
                }
            }
        }
    }
}
