//
//  AppDelegate.swift
//  SharePostsDemo
//
//  Created by Gurleen Osahan on 2/4/20.
//  Copyright © 2020 Gurleen Osahan. All rights reserved.
//

import UIKit
import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            let facebookDidHandle = ApplicationDelegate.shared.application(app,open: url as URL ,sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?,annotation: options[UIApplication.OpenURLOptionsKey.annotation])
             
             return facebookDidHandle
         }
         func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
             return ApplicationDelegate.shared.application(application,open: url as URL ,sourceApplication: sourceApplication,annotation: annotation)
             
             
         }
}

