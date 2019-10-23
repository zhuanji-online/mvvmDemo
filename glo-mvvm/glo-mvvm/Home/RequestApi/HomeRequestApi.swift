//
//  HomeRequestApi.swift
//  glo-mvvm
//
//  Created by 闫树军 on 2019/10/23.
//  Copyright © 2019 gloglo. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

// 首页接口提供者
let HomeRequestApiProvider = MoyaProvider<HomeRequestApi>()

enum HomeRequestApi {
    // 首页title
    case topics
}


extension HomeRequestApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://xxxx.com/api")!
    }
    
    var path: String {
        return "/topics"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
         return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .requestParameters(parameters: [:] , encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
