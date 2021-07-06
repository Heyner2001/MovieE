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
    
    private let searchUrlBase = "https://api.themoviedb.org/3/search/movie"
    func getSearchUrl(search: String) -> String {
        let seearchWithoutSpaces = search.replacingOccurrences(of: " ", with: "%20")
        return searchUrlBase + accessToken + "&query=" + seearchWithoutSpaces
    }
    
    // ------- Copies --------
    //    Home copies
    let homeTitle = "MovieE"
    let searchPlaceholder = "Search the movies here"
    let emptyResultsEmoji = "😕"
    let emptyResultsTitle = "This search contains no result"
    let voteCountTitle = "Number of votes: "
    let qualificationTitle = "Qualification: "
    let originalLanguageTitle = "Original language: "
    
    private init() {}
}
