//
//  Router.swift
//  Router
//
//  Created by iya on 2022/11/28.
//

import Foundation

/// 页面跳转方式
public enum TransitionType {
    
    /// 通过导航栏栈显示
    case show
    
    /// 通过模态方式显示
    case present
}
