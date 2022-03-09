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
    
    func fetchMovie() {
        movieService.nowPlayingRequest { movies in
            self.presenter?.fetchMovieWithSuccess(movieArray: movies)
        }
    }
    
    
}
