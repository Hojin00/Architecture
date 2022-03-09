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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieViewController: PresenterToViewProtocol {
    func updateMovieWithSuccess(movieArray: Array<MovieModel>) {
        print(movieArray)
    }
    
    func updateMovieError() {
        print("error")
    }
    
}


