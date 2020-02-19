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
    
    var body: some View {
        NavigationView {
            Group {
                if moviesList.isLoading {
                    Text("loading...")
                } else {
                    List(self.moviesList.list.movies ?? [], id: \.id) { movie in
                        MovieRowView(movie: movie)
                    }
                }
            }
        }
        .onAppear {
            if let moviesArray = self.moviesList.list.movies {
                if moviesArray.isEmpty {
                    self.moviesList.reload()
                }
            }
        }
    }
}
