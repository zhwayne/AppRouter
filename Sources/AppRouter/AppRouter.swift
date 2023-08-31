//
//  Router.swift
//  Router
//
//  Created by iya on 2022/11/28.
//

import UIKit

private extension UIApplication {
    var rootViewController: UIViewController? {
        guard let window = UIApplication.shared.delegate?.window else { return nil }
        return window?.rootViewController
    }
}

public final class AppRouter: AppRouting {

    public static let shared = AppRouter()
    
    private var navigators: [String: Navigating] = [:]
    
    private init() {}
    
    public func register(path: RoutingPath, navigator: Navigating) {
        navigators[path.routingPath.lowercased()] = navigator
    }
    
    public func route(to destination: RoutingDestination, from routingSource: RoutingSource?, using transitionType: TransitionType?) {
        guard let sourceViewController = routingSource as? UIViewController ?? UIApplication.shared.rootViewController else {
            return
        }

        guard let url = destination.routingUrl,
              let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return
        }
        let path = url.path.lowercased()
        let parameters = urlComponents.queryItems?.reduce(into: [String: String](), { result, item in
            if let value = item.value {
                result[item.name] = value
            }
        }) ?? [:]
        navigators[path]?.navigate(from: sourceViewController, using: transitionType, parameters: parameters)
    }
}
