//
//  MovieDetailView.swift
//  Moviewer
//
//  Created by Victor Oka on 20/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    
    var movie: Movie
    var genreList: GenreList
    
    @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    
    var body: some View {
        Group {
                List {
                    PosterView(image: self.imageLoader.image)
                        .onAppear {
                            if let imagePath = self.movie.posterPath {
                                let movieBanner = ImagePath.buildImagePath(withSize: "500", for: imagePath)
                                if let url = movieBanner.url {
                                    self.imageLoader.downloadImage(url: url)
                                }
                            }
                        }
                    MovieSectionView(movie: movie, genreList: genreList)
                }
            }
            .edgesIgnoringSafeArea([.top])
        }
        
}

// MARK: Poster View
struct PosterView: View {
    
    var image: UIImage?
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .aspectRatio(500/750, contentMode: .fit)
            
            if image != nil {
                Image(uiImage: self.image!)
                    .resizable()
                    .aspectRatio(500/750, contentMode: .fit)
            }
        }
    }
}

// MARK: Movie Section View
struct MovieSectionView: View {
    
    var movie: Movie
    var genreList: GenreList
    
    var body: some View {
        Section {
            Text(movie.title)
                .font(.title)
            Text("\(MoviewerHelper.getGenresLabel(for: movie.genres, list: genreList))")
                .font(.subheadline)
            Text("Release date: \(movie.releaseDateTextFormatted)")
                .font(.subheadline)
            Text(movie.overview)
                .font(.body)
                .lineLimit(nil)
        }
    }
}
