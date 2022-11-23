//
//  HomeViewAPIService.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/23.
//

import Foundation
import Moya

struct HomeViewAPIService {
    
    static func requestProductReccomendLists(completion: @escaping(Result<[ProductItem], Error>)->Void) {
        let provider = MoyaProvider<HomeViewRouter>()
        provider.request(.productRecommend) { result in
            switch result {
            case let .success(response):
                let result = try! response.map(ProductRecommendResponseDTO.self)
                completion(.success(result.data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func requestTVONLists(completion: @escaping(Result<[TVListItem], Error>)->Void) {
        let provider = MoyaProvider<HomeViewRouter>()
        provider.request(.TVONLIVE) { result in
            switch result {
            case let .success(response):
                let result = try! response.map(TVONLIVEListResponseDTO.self)
                completion(.success(result.data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
