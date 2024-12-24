//
//  TrendingUseCase.swift
//  MoovieeAPP
//
//  Created by Javidan on 24.12.24.
//

import Foundation
protocol TrendingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(MovieDTO?, String?) -> Void)
}
