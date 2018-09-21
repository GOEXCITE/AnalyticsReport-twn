//
//  AppDelegate.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/08.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print("Starting")
//        Report_ObserveDetailResultCountAndAmbiguousConditionType.shared.observe()
        Report_UUIDApplyActivityAna().start()
        return true
    }
}
