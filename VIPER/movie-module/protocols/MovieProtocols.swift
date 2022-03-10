//
//  protocols.swift
//  VIPER
//
//  Created by Hojin Ryu on 05/03/22.
//

import Foundation
import UIKit

//ViewtoPresenterProtocol
    // reference to router, view, interactor
    // a function to just "ask" to fetch movie in interactor

protocol ViewToPresenterProtocol {
    var router: PresenterToRouterProtocol? { get set }
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    
    func askFetchingMovie()
    
}


//PresenterToViewProtocol
    // a function to returns a data that came from interactor
        // can divide up into two
            // 1. func success 2. func failure

protocol PresenterToViewProtocol {
    func updateNowPlayingMovieWithSuccess(movieArray: Array<MovieModel>)//completion handler
    func updateNowPlayingMovieError()
    
    func updatePopularMovieWithSuccess(movieArray: Array<MovieModel>)//completion handler
    func updatePopularMovieError()
}


// PresenterToInteractorProtocol
    // a function to really fetch movie in interactor

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchNowPlayingMovie()
    func fetchPopularMovie()
}


// PresenterToRouterProtocol
    // a function to create a module

protocol PresenterToRouterProtocol {
    static func createNewModule() -> UINavigationController
    func pushToDetailScreen(navigationController: UINavigationController)
}


// InteractorToPresenterProtocol
    // similar to presenter->view protocol but not the same.
    // 1. func success 2. func failure

protocol InteractorToPresenterProtocol {
    func fetchNowPlayingMovieWithSuccess(movieArray: Array<MovieModel>)//completion handler
    func fetchNowPlayingMovieError()
    
    func fetchPopularMovieWithSuccess(movieArray: Array<MovieModel>)//completion handler
    func fetchPopularMovieError()
}





    
