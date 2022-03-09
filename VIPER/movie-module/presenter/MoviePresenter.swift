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
        interactor?.fetchMovie()
    }
    
    
}

extension MoviePresenter: InteractorToPresenterProtocol {
    func fetchMovieWithSuccess(movieArray: Array<MovieModel>) {
        view?.updateMovieWithSuccess(movieArray: movieArray)
    }
    
    func fetchMovieError() {
        view?.updateMovieError()
    }
    
}

