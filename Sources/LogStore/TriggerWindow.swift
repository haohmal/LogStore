//
//  File.swift
//  
//
//  Created by Andreas Eckerle on 29.04.20.
//

import UIKit
import CoreMotion

public class TriggerWindow : UIWindow {
    let motionManager = CMMotionManager()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        motionManager.startAccelerometerUpdates(to: .main) {
            [unowned self] data, error in
            
            guard let data = data else { return }
            if data.acceleration.x < -5 {
                print("x accerleration: \(data.acceleration.x)")
                self.presentLog()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func presentLog() {
        let visible = visibleViewController(from: rootViewController)
        let logViewController = LogViewController()
        visible?.present(logViewController, animated: true, completion: nil)
    }
    
    func visibleViewController(from viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            
            return visibleViewController(from: navigationController.topViewController)
        }
        if let tabBarController = viewController as? UITabBarController {
            return visibleViewController(from: tabBarController.selectedViewController)
        }
        if let presentedViewController = viewController?.presentingViewController {
            return visibleViewController(from: presentedViewController)
        }
        return viewController
    }
}
