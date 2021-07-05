//
//  AppStringSources.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 3/07/21.
//

import Foundation

//This class contains all string source required for the app
class StringSources {
    
    static var shared = StringSources()
    
    // ------ URLs ------
    private let accessToken = "?api_key=79e43426851035c2be1a8fc69c9a12d4"
    private let urlBase = "https://api.themoviedb.org/3"
    func getMoviesForPage(page: Int) -> String {
        return urlBase + "/discover/movie" + accessToken + "&page=\(page)"
    }
    
    private let movieImageUrlBase = "https://image.tmdb.org/t/p/w500"
    func getImageMoviesUrl(imageName: String) -> URL? {
        return URL(string: movieImageUrlBase + imageName)
    }
    
    // ------- Copies --------
    //    Home copies
    let homeTitle = "MovieE"
    
    private init() {}
}
