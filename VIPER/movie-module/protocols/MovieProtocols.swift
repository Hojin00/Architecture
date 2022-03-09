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
    func updateMovieWithSuccess(movieArray: Array<MovieModel>)//completion handler
    func updateMovieError()
}


// PresenterToInteractorProtocol
    // a function to really fetch movie in interactor

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchMovie()
}


// PresenterToRouterProtocol
    // a function to create a module

protocol PresenterToRouterProtocol {
    func createNewModule() -> MovieViewController
    func pushToDetailScreen(navigationController: UINavigationController)
}


// InteractorToPresenterProtocol
    // similar to presenter->view protocol but not the same.
    // 1. func success 2. func failure

protocol InteractorToPresenterProtocol {
    func fetchMovieWithSuccess(movieArray: Array<MovieModel>)//completion handler
    func fetchMovieError()
}





    
