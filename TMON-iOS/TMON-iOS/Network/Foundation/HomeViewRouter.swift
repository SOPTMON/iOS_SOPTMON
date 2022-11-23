//
//  HomeViewRouter.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/23.
//

import Foundation
import Moya

enum HomeViewRouter {
    
    case productRecommend
    case TVONLIVE
    
}

extension HomeViewRouter: TargetType {
    var baseURL: URL {
        URL(string: "http://15.164.135.171:3000")!
    }
    
    var path: String {
        switch self {
        case .productRecommend:
            return "/custom"
        case .TVONLIVE:
            return "/live"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .productRecommend, .TVONLIVE:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .productRecommend, .TVONLIVE:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .productRecommend, .TVONLIVE:
            return ["Content-Type": "application/json"]
        }
    }
}
