//
//  TrendingAPIService.swift
//  MoovieeAPP
//
//  Created by Javidan on 24.12.24.
//

import Foundation

private let apiService = CoreAPIManager.instance
final class TrendingAPIService: TrendingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping (MovieDTO?, String?) -> Void) {
        apiService.request(
            type: MovieDTO.self,
            url: TrendingHelper.all(timeInterval).endPoint,
            method: .GET) { [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
                
            }

    }
    
    
}
