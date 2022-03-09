//
//  movieAPI.swift
//  VIPER
//
//  Created by Hojin Ryu on 09/03/22.
//

import Foundation

class LocalMoviesLists {
   var listName: String?
   var movieList: [MovieModel]?
     
   init(listName: String, movieList: [MovieModel]) {
       self.listName = listName
       self.movieList = movieList
   }
}

struct MovieAPI {
    
    private let apiKey = "2f8e29176bab443251fb4a3303db7498"
    
    
    func nowPlayingRequest(page: Int = 1, completionHandler: @escaping ([MovieModel]) -> Void) {
        if page < 0 {fatalError("Page should not be lower than 1")}
        guard let url = URL(string: ("https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US&page=") + "\(page)") else {
            fatalError("URL not found")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            typealias MovieData = [String: Any]
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let movies = dictionary["results"] as? [MovieData]
            else {
                completionHandler([])
                return
            }
            
            var localMoviesList: [MovieModel] = []
            
            for recivedMovie in movies {
                guard let id = recivedMovie["id"] as? Int,
                      let title = recivedMovie["original_title"] as? String,
                      let overview = recivedMovie["overview"] as? String,
                      let voteAverage = recivedMovie["vote_average"] as? Double,
                      let posterPath = recivedMovie["poster_path"] as? String
                else { continue }
                let movie = MovieModel(id: id, title: title, voteAverage: voteAverage, overview: overview, posterPath: posterPath)
                localMoviesList.append(movie)
            }
            completionHandler(localMoviesList)
        }
        .resume()
    }
    
    func popularRequest(page: Int = 1, completionHandler: @escaping ([MovieModel]) -> Void) {
        if page < 0 {fatalError("Page should not be lower than 1")}
        guard let url = URL(string: ("https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=") + "\(page)") else {
            fatalError("URL not found")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            typealias MovieData = [String: Any]
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let movies = dictionary["results"] as? [MovieData]
            else {
                completionHandler([])
                return
            }
            
            var localMoviesList: [MovieModel] = []
            
            for recivedMovie in movies {
                guard let id = recivedMovie["id"] as? Int,
                      let title = recivedMovie["original_title"] as? String,
                      let overview = recivedMovie["overview"] as? String,
                      let voteAverage = recivedMovie["vote_average"] as? Double,
                      let posterPath = recivedMovie["poster_path"] as? String
                else { continue }
                let movie = MovieModel(id: id, title: title, voteAverage: voteAverage, overview: overview, posterPath: posterPath)
                localMoviesList.append(movie)
                if localMoviesList.count > 1 {
                    break
                }
            }
            completionHandler(localMoviesList)
        }
        .resume()
    }
    
    func movieGenresRequest(movieId: Int, completionHandler: @escaping ([String]) -> Void){
        let urlString = "https://api.themoviedb.org/3/movie/520763?api_key=bf35d76c9fdeedd3180a8323a950dade&language=en-US"
        guard let url = URL(string: urlString) else {
            fatalError("URL not found")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            typealias GenreData = [String: Any]
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let genres = dictionary["genres"] as? [[String:Any]]
            else {
                completionHandler([])
                return
            }
            
            
            var genresList: [String] = []
            
            for genre in genres{
                guard let name = genre["name"] as? String
                else {continue}
                genresList.append(name)
            }
            completionHandler(genresList)

        }
        .resume()
    }
    
}
