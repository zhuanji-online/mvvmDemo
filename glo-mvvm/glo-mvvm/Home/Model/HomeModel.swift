//
//  HomeModel.swift
//  glo-mvvm
//
//  Created by 闫树军 on 2019/10/23.
//  Copyright © 2019 gloglo. All rights reserved.
//

import Foundation
import HandyJSON

struct HomeModel: HandyJSON {
    var id: Int = 0
    var name: String!
    var sortNumber: Int = 0
    var imagePC: String?
    var createdAt, updatedAt: String!
    var deletedAt: String?
}
