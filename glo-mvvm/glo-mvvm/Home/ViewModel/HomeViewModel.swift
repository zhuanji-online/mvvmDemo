//
//  HomeViewModel.swift
//  glo-mvvm
//
//  Created by 闫树军 on 2019/10/23.
//  Copyright © 2019 gloglo. All rights reserved.
//

import Foundation
import SwiftyJSON
import HandyJSON

struct HomeViewModel {
    
    static func getHomeTopics(callback: @escaping ([HomeModel]) ->() ) {
        var topicsList = [HomeModel]()
//        HomeRequestApiProvider.request(.topics) { (result) in
//            if case let .success(response) = result {
//                let data = try? response.mapJSON()
//                let json = JSON(data!)
//                topicsList = JSONDeserializer<HomeModel>.deserializeModelArrayFrom(json: json["data"].description) as! [HomeModel]
//            }
            
            // 模拟数据请求
            topicsList.append(HomeModel.init(name:"111"))
            topicsList.append(HomeModel.init(name:"222"))
            topicsList.append(HomeModel.init(name:"333"))
            topicsList.append(HomeModel.init(name:"444"))
            print("topics: \(topicsList)")
            callback(topicsList)

//        }
    }
    
    static func getMoreHomeTopics(callback: @escaping (HomeModel) ->() ) {
        callback(HomeModel.init(name:"555"))
    }
    
}
