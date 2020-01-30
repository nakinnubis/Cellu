//
//  AppDelegate.swift
//  Cellulant
//
//  Created by Oluwafemi Faseyitan on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate  {

    var window: UIWindow?

    
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        Messaging.messaging().apnsToken = deviceToken
//
//       InstanceID.instanceID().instanceID { (result, error) in
//            if let error = error {
//                print("Error fetching remote instange ID: \(error)")
//            } else if let result = result {
//                print("Remote instance ID token: \(result.token)")
//            }
//        }
//    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
     
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
        return true
    }
 
    // Push notification received
    func application(_ application: UIApplication, didReceiveRemoteNotification data: [AnyHashable : Any]) {
        // Print notification payload data
      
    }

   func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
     // If you are receiving a notification message while your app is in the background,
     // this callback will not be fired till the user taps on the notification launching the application.
     // TODO: Handle data of notification

     // With swizzling disabled you must let Messaging know about the message, for Analytics
     // Messaging.messaging().appDidReceiveMessage(userInfo)

     // Print message ID.
    

     // Print full message.
     print(userInfo)

     completionHandler(UIBackgroundFetchResult.newData)
   }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


