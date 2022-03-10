//
//  router.swift
//  VIPER
//
//  Created by Hojin Ryu on 05/03/22.
//

import Foundation
import UIKit

class MovieRouter: PresenterToRouterProtocol {

   static func createNewModule() -> UINavigationController {
        let moviesStoryboard = UIStoryboard(name: "MoviesStoryboard", bundle: nil)
        let moviesViewController = moviesStoryboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController

        let navigationController = moviesStoryboard.instantiateViewController(withIdentifier: "MoviesNavigationController") as! MoviesNavigationController

        navigationController.viewControllers = [moviesViewController]


        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = MoviePresenter()
        var interactor: PresenterToInteractorProtocol = MovieInteractor()
        let router:PresenterToRouterProtocol = MovieRouter()

        moviesViewController.presenter = presenter
        presenter.view = moviesViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return navigationController

    }

    func pushToDetailScreen(navigationController: UINavigationController) {

    }

}
