//
//  TrendingHelper.swift
//  MoovieeAPP
//
//  Created by Javidan on 24.12.24.
//

import Foundation
enum TrendingHelper {
    case all(String)
    
    private var mainPath: String {
        return "trending/"
    }
    
     var endPoint: URL? {
        switch self {
        case .all(let query):
            return CoreAPIHelper.instance.makeURL(path: "\(mainPath)all/\(query)")
        }
    }
    
   
}
