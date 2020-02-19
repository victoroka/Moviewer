//
//  ContentView.swift
//  Moviewer
//
//  Created by Victor Oka on 18/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var moviesList = MoviesList()
    var body: some View {
        Button(action: {
            self.moviesList.reload()
        }) {
            Text("Tap Here")
        }
    }
}
