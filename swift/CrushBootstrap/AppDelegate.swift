//
//  AppDelegate.swift
//  CrushBootstrap
//
//  Created by mwermuth on 20/08/14.
//  Copyright (c) 2014 Crush & Lovely. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        
        self.initializeLoggingAndServices()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    // MARK: Services
    
    /**
    Connects to Crashlytics and sets up CocoaLumberjack
    */
    func initializeLoggingAndServices() {
        let crashlyticsAPIKey : String = "<<CrashlyticsAPIKey>>"
        
        if Array(crashlyticsAPIKey)[0] != "<" {
            Crashlytics.startWithAPIKey(crashlyticsAPIKey)
        }
        else{
            println("Set your Crashlytics API key in the app delegate to enable Crashlytics integration!")
        }
        
        var logFormatter : CRLMethodLogFormatter = CRLMethodLogFormatter()
        DDASLLogger.sharedInstance().setLogFormatter(logFormatter)
        DDTTYLogger.sharedInstance().setLogFormatter(logFormatter)
        
        DDLog.addLogger(DDASLLogger.sharedInstance())
        DDLog.addLogger(DDTTYLogger.sharedInstance())
        
        CrashlyticsLogger.sharedInstance().setLogFormatter(logFormatter)
        DDLog.addLogger(CrashlyticsLogger.sharedInstance(), withLogLevel: LOG_LEVEL_ERROR)
    }
    
    
    /**
    Schedules a check for updates to the app in the Installr API. Only executed for Ad Hoc builds,
    not targetting the simulator (i.e. archives of the -Staging and -Production schemes).
    */
    func scheduleCheckForUpdates(){
        
        #if AdHoc
            let installrAppToken = "Installer App Token"
        
            CRLAperitif.sharedInstance().appToken = installrAppToken
            CRLAperitif.sharedInstance().checkAfterDelay(3.0)
        #endif
    }

}

