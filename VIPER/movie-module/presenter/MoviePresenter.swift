//
//  presenter.swift
//  VIPER
//
//  Created by Hojin Ryu on 05/03/22.
//

import Foundation

class MoviePresenter: ViewToPresenterProtocol {
    
    var router: PresenterToRouterProtocol?
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?


    func askFetchingMovie() {
        interactor?.fetchNowPlayingMovie()
        interactor?.fetchPopularMovie()
    }

}

extension MoviePresenter: InteractorToPresenterProtocol {
    func fetchPopularMovieWithSuccess(movieArray: Array<MovieModel>) {
        view?.updatePopularMovieWithSuccess(movieArray: movieArray)
    }
    
    func fetchPopularMovieError() {
        view?.updatePopularMovieError()
    }
    
    func fetchNowPlayingMovieWithSuccess(movieArray: Array<MovieModel>) {
        view?.updateNowPlayingMovieWithSuccess(movieArray: movieArray)
    }
    
    func fetchNowPlayingMovieError() {
        view?.updateNowPlayingMovieError()
    }
    
}

