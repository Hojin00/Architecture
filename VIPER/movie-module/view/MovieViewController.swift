//
//  view.swift
//  VIPER
//
//  Created by Hojin Ryu on 05/03/22.
//

import Foundation
import UIKit

class MovieViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    var movieLists: Array<MovieModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.askFetchingMovie()
    }
}

extension MovieViewController: PresenterToViewProtocol {
    func updateMovieWithSuccess(movieArray: Array<MovieModel>) {
        self.movieLists = movieArray
        print(movieArray)
        // update a view
    }
    
    func updateMovieError() {
        print("error")
        // print error in asking fetch
    }
    
}


