//
//  Router.swift
//  Router
//
//  Created by iya on 2022/11/28.
//

import Foundation

public protocol RoutingPath: RoutingDestination {
    
    var routingPath: String { get }
}
