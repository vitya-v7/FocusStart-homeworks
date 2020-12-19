//
//  SceneDelegate.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let winScene = (scene as? UIWindowScene) else { return }
		self.window = UIWindow(windowScene: winScene)
		
		let companyVC = CompanyViewController()
		let navigationController = UINavigationController(rootViewController: companyVC)
		self.window?.rootViewController = navigationController
		
		self.window?.makeKeyAndVisible()
	}
}

