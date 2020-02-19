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
    
    var body: some View {
        Text(movie.title)
    }
}
