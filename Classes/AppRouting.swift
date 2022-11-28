//
//  Router.swift
//  Router
//
//  Created by iya on 2022/11/28.
//

import Foundation

public protocol AppRouting {
         
    /// 注册路由
    /// - Parameters:
    ///   - path: 路由路径
    ///   - navigator: 路由的具体实现
    func register(path: RoutingPath, navigator: Navigating)
    
    /// 路由到特定的路径
    /// - Parameters:
    ///   - destination: 路由地址
    ///   - routingSource: 路由的源址
    ///   - transitionType: 页面跳转类型，如果为空，则由 navigator 自行处理。
    func route(to destination: RoutingDestination, from routingSource: RoutingSource?, using transitionType: TransitionType?)
}
