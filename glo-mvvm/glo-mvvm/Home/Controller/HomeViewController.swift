//
//  HomeViewController.swift
//  glo-mvvm
//
//  Created by 闫树军 on 2019/10/23.
//  Copyright © 2019 gloglo. All rights reserved.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    var titleView = HomeTitleView()
    var topicsList = [HomeModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTopics()
        
    }
    
    func loadTopics() {
        HomeViewModel.getHomeTopics { (result) in
            print("result: \(result)")
            self.topicsList = result
            self.setUpTitleView(topics: self.topicsList)
        }
    }
    
    func setUpTitleView(topics: [HomeModel]) {
        titleView.setUpUI(topicList: topics)
        titleView.backgroundColor = UIColor.red
        self.view.addSubview(titleView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.right.equalTo(0)
            make.height.equalTo(90)
        }
        
        titleView.loadMoreBlock {
            HomeViewModel.getMoreHomeTopics { (result) in
                self.topicsList.append(result)
                self.titleView.refreshTitleView(topicList: self.topicsList)
            }
            
        }
        
    }
    



}
