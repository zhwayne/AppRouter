//
//  Router.swift
//  Router
//
//  Created by iya on 2022/11/28.
//

import UIKit

public protocol Navigating {
    
    /// 接收到路由指令
    /// - Parameters:
    ///   - viewController: 从哪个控制器来
    ///   - transitionType: 页面跳转类型
    ///   - parameters: 附带的参数
    func navigate(from viewController: UIViewController, using transitionType: TransitionType?, parameters: [String: String])
}

public extension Navigating {
    
    /// 执行路由
    /// - Parameters:
    ///   - sourceViewController: 从哪个控制器来
    ///   - destinationViewController: 路由到哪个控制器去
    ///   - transitionType: 页面跳转类型，如果为空，则不处理。
    func navigate(from sourceViewController: UIViewController,
                  to destinationViewController: UIViewController,
                  using transitionType: TransitionType?) {
        switch transitionType {
        case .show:
            if let navigationController = sourceViewController.navigationController {
                navigationController.pushViewController(destinationViewController, animated: true)
                break
            }
            if let navigationController = sourceViewController as? UINavigationController {
                navigationController.pushViewController(destinationViewController, animated: true)
                break
            }
            if let tabBarController = sourceViewController as? UITabBarController,
               let navigationController = tabBarController.selectedViewController as? UINavigationController {
                    navigationController.pushViewController(destinationViewController, animated: true)
                    break
            }
            #if DEBUG
            fatalError("Can not show a view controller with transition type \(transitionType)")
            #endif
            
        case .present:
            sourceViewController.showDetailViewController(destinationViewController, sender: nil)
        case .none:
            break
        }
    }
}
