//
//  AppDelegate.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	static var backgroundSessionCompletionHandler: (() -> Void)?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for imageization after application launch.
		return true
	}
	
	// MARK: UISceneSession Lifecycle
	
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
	
	func application(
		_ application: UIApplication,
		handleEventsForBackgroundURLSession
			handleEventsForBackgroundURLSessionidentifier: String,
		completionHandler: @escaping () -> Void) {
		AppDelegate.backgroundSessionCompletionHandler = completionHandler
		let dataTaskService = DataTaskService()
		dataTaskService.configSession()
	}
}

