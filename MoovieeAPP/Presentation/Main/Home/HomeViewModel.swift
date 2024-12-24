//
//  HomeViewModel.swift
//  MoovieeAPP
//
//  Created by Javidan on 23.12.24.
//

import Foundation
final class HomeViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
        }
    enum TimeInterval: String {
        case day, week
    }
    
    private let trendingUseCase: TrendingUseCase
    private var timeType: TimeInterval = .day
    private (set) var movieDTO: MovieDTO?
    var requestCallback: ((ViewState)->Void)?
    
    init(){
        trendingUseCase = TrendingAPIService()
    }
    
    func getMovieList() {
        requestCallback?(.loading)
        trendingUseCase.getTrendingMovie(
            timeInterval: timeType.rawValue) { [weak self] dto, error in
                guard let self else {return}
                requestCallback?(.loaded)
                if let dto = dto {
                    movieDTO = dto
                    requestCallback?(.success)
                } else if let error = error {
                    requestCallback?(.error(error))
                }
            }
    }
    
}
