//
//  CoreAPIHelper.swift
//  MoovieeAPP
//
//  Created by Javidan on 24.12.24.
//

import Foundation

enum HttpMethods: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}

enum BaseURL: String {
    case prod = "https://api.themoviedb.org/3/"
}

final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    private let baseURL = BaseURL.prod.rawValue
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURL + path
        return URL(string:urlString)
    }
    
    func makeHeader() -> [String: String] {
        return [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYjM2ODE1OGJjNDI0NjZiZDcyMzNlNGRjYjFkMjU5MyIsIm5iZiI6MTczNDY5Njk1MS41MzYsInN1YiI6IjY3NjU1ZmY3YWUxYjQxMWY0MDVkZmI5MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.50B3anFEo6tAe_R2Vs66MJdbwk9rydZ5z4SZLjBAA9E"]
    }
}

