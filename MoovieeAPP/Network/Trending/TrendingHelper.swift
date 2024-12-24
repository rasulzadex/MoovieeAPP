//
//  TrendingHelper.swift
//  MoovieeAPP
//
//  Created by Javidan on 24.12.24.
//

import Foundation
enum TrendingHelper {
    case all
    
    
     var endPoint: URL? {
        switch self {
        case .all:
            return CoreAPIHelper.instance.makeURL(path: "all/")
        }
    }
    
   
}
