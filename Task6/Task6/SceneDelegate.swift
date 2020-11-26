//
//  SceneDelegate.swift
//  Task6
//
//  Created by user183410 on 11/23/20.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return assertionFailure() }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		guard let window = window else { return assertionFailure() }
		window.windowScene = windowScene
		let viewController = MyViewController()
		window.rootViewController = viewController
		window.makeKeyAndVisible()
	}
}

