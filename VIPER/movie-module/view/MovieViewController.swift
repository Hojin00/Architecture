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

    var nowPlayingMovieLists: Array<MovieModel> = Array()
    var popularMovieLists: Array<MovieModel> = Array()

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
    
    
    func updateNowPlayingMovieWithSuccess(movieArray: Array<MovieModel>) {
        self.nowPlayingMovieLists = movieArray
        print(movieArray)
        // update a view
    }
    
    func updateNowPlayingMovieError() {
        print("error")
        // print error in asking fetch
    }
    
    func updatePopularMovieWithSuccess(movieArray: Array<MovieModel>) {
        self.popularMovieLists = movieArray
        print(movieArray)
        // update a view
    }
    
    func updatePopularMovieError() {
        print("error")
        // print error in asking fetch
    }
    
}
extension MovieViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  {
            return popularMovieLists.count
        }
        else if section == 1 {
            return nowPlayingMovieLists.count
        }
        else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var thisModel:MovieModel

        if indexPath.section == 0 {
            thisModel = popularMovieLists[indexPath.row]
        }
        else if indexPath.section == 1 {
            thisModel = nowPlayingMovieLists[indexPath.row]
        }
        else {
            return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListTableViewCell") as? MoviesListTableViewCell else {
            return UITableViewCell()
        }

        //cell.movieImage = thisModel.

        cell.movieTitleLabel.text = thisModel.title
        cell.movieDescriptionLabel.text = thisModel.overview
        cell.movieDescriptionLabel.text = thisModel.voteAverage



        return cell
    }

}


