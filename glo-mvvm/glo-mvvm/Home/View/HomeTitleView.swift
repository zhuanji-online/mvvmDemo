//
//  HomeTitleView.swift
//  glo-mvvm
//
//  Created by 闫树军 on 2019/10/23.
//  Copyright © 2019 gloglo. All rights reserved.
//

import UIKit
import DNSPageView

class HomeTitleView: UIView {
    
    private var titleView: PageTitleView!
    
    private var loadMoreBlock: (()-> Void)!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    public func setUpUI(topicList:[HomeModel]) {
        let style = PageStyle()
        style.titleViewBackgroundColor = UIColor.white
        style.isShowCoverView = false
        style.titleSelectedColor = UIColor.red
        style.titleColor = UIColor.gray
        style.isTitleScaleEnabled = true
        style.titleMargin = 25
        style.titleFont = UIFont.systemFont(ofSize: 16.0)
        style.isTitleViewScrollEnabled = false
        
        
        let topics = topicList.map { a -> String in
            return a.name!
        }
        print("topics.names : \(topics)")
   
        titleView = PageTitleView.init(frame: CGRect.zero, style: style, titles: topics, currentIndex: 0)
        self.addSubview(titleView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(50)
        }
        
        
        let button = UIButton.init(type: .custom)
        button.setTitle("模拟刷新交互", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(loadMore), for: .touchUpInside)
        self.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(self.titleView.snp.bottom).offset(0)
            make.height.equalTo(40)
        }
    }
    
    public func loadMoreBlock(block:@escaping (() -> Void)) {
        self.loadMoreBlock = block
    }
    
    public func refreshTitleView(topicList:[HomeModel]) {
        titleView.removeFromSuperview()
        self.setUpUI(topicList: topicList)
    }
    
    
    @objc private func loadMore() {
        if self.loadMoreBlock != nil {
            self.loadMoreBlock()
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}
