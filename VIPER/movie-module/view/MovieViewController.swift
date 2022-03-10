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

    @IBOutlet weak var movieListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        movieListTableView.dataSource = self
        movieListTableView.delegate = self

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
extension MovieViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  {
            return 2
        }
        else {
            return presenter?.getNumberOfRowsForNowPlaying() ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



    }

}


