//
//  DetailsMovieViewModel.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 18/04/24.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    var movieImage: URL?
    
    init(movie: Movie) {
        self.movie = movie
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
