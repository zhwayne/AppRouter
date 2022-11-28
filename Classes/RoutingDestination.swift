//
//  Router.swift
//  Router
//
//  Created by iya on 2022/11/28.
//

import Foundation

public protocol RoutingDestination {
    var routingUrl: URL? { get }
}

public extension RoutingDestination where Self == String {
    
    var routingUrl: URL? {
        return URL(string: self)
    }
}

public extension RoutingDestination where Self == URL {
    
    var routingUrl: URL? {
        return self
    }
}

public extension RoutingDestination where Self: RoutingPath {
    
    var routingUrl: URL? {
        return self.routingPath.routingUrl
    }
}

extension String: RoutingDestination {}
extension URL: RoutingDestination {}

public extension RoutingDestination {
    
    func adding(parameters: [String: String]) -> RoutingDestination? {
        guard let url = self.routingUrl,
              var urlCompts = URLComponents(string: url.absoluteString) else {
            return nil
        }
        if var queryItem = urlCompts.queryItems, !queryItem.isEmpty {
            let items = parameters.map { URLQueryItem(name: $0, value: $1) }
            queryItem.append(contentsOf: items)
            urlCompts.queryItems = items
        } else {
            let items = parameters.map { URLQueryItem(name: $0, value: $1) }
            urlCompts.queryItems = items
        }
        return urlCompts.url
    }
}
