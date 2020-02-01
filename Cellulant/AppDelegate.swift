//
//  AppDelegate.swift
//  Cellulant
//
//  Created by Akinnubi Abiola on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit
import IQKeyboardManager
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate  {

    var window: UIWindow?

    
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // Override point for customization after application launch.
       IQKeyboardManager.shared().isEnabled = true
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
    let loginViewController: LoginViewController = mainStoryboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController

    self.window?.rootViewController = loginViewController
    self.window?.makeKeyAndVisible()
       return true
   }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
     
    }
   
 
    // Push notification received
    func application(_ application: UIApplication, didReceiveRemoteNotification data: [AnyHashable : Any]) {
      
      
    }

   func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
     

     completionHandler(UIBackgroundFetchResult.newData)
   }

    func applicationWillResignActive(_ application: UIApplication) {
     
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
     
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
 
    }

    func applicationWillTerminate(_ application: UIApplication) {
      
    }


}


