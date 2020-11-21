//
//  SceneDelegate.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	@available(iOS 13.0, *)
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return assertionFailure() }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		guard let window = window else { return assertionFailure() }
		window.windowScene = windowScene
		let viewController = TabBarController()
		window.rootViewController = viewController
		window.makeKeyAndVisible()
	}
}
