//
//  interactor.swift
//  VIPER
//
//  Created by Hojin Ryu on 05/03/22.
//

import Foundation

class MovieInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    let movieService = MovieAPI()
    
    func fetchNowPlayingMovie() {
        movieService.nowPlayingRequest { movies in
            self.presenter?.fetchNowPlayingMovieWithSuccess(movieArray: movies)
        }
    }
    
    func fetchPopularMovie() {
        movieService.popularRequest { movies in
            self.presenter?.fetchPopularMovieWithSuccess(movieArray: movies)
        }
    }
    
    
}
