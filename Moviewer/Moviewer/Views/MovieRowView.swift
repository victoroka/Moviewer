//
//  MovieRowView.swift
//  Moviewer
//
//  Created by Victor Oka on 19/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import SwiftUI

struct MovieRowView: View {
    
    var movie: Movie
    @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if imageLoader.image != nil {
                GeometryReader { geometry in
                    Image(uiImage: self.imageLoader.image!)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geometry.size.width)
                        .clipped()
                }
            }
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                Text("\(movie.voteAverage)")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(Rectangle().foregroundColor(Color.black).opacity(0.6).blur(radius: 2.5))
        }
        .background(Color.secondary)
        .cornerRadius(10)
        .shadow(radius: 20)
        .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
        .frame(height: 300)
        .onAppear {
            if let imagePath = self.movie.posterPath {
                let movieBanner = ImagePath.buildImagePath(withSize: "300", for: imagePath)
                if let url = movieBanner.url {
                    self.imageLoader.downloadImage(url: url)
                }
            }
        }
    }
}
