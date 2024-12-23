//
//  CoreAPIHelper.swift
//  CountryAPP
//
//  Created by Javidan on 10.12.24.
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
    case prod = ""
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
        return ["Authoration": "Barear Token"]
    }
}
