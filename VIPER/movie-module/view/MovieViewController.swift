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
    
    func updateMovieWithSuccess() {
        <#code#>
    }
    
    func updateMovieError() {
        <#code#>
    }
    
}


