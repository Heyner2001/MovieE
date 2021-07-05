//
//  MoviesModel.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 3/07/21.
//

import Foundation
import UIKit

struct MoviesPage: Codable {
    let page: Int?
    let results: [Movie]
    let totalResults: Int?
    let totalPages: Int?
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct Movie: Codable {
    let posterPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Float
    let voteCount: Int
    let video: Bool
    let voteAverage: Float
    
    private enum CodingKeys: String, CodingKey {
        case adult, overview, id, title, popularity, video
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}

class MoviesModel {
    
    func parseJSON(jsonData: Data?) -> MoviesPage? {
        
        guard let data = jsonData else { return nil }
        var moviesPage: MoviesPage? = nil
        
        do {
            moviesPage = try JSONDecoder().decode(MoviesPage.self, from: data)
        } catch { print(error.localizedDescription) }
        
        return moviesPage
    }
}
