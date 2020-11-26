//
//  SceneDelegate.swift
//  Task6.2
//
//  Created by Admin on 25.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	public enum Names {
		case Alexander
		case Dmitry
		case Viktor
		case Anton
	}

	public enum Professions: String {
		case Electrician
		case Waiter
		case Doorman
		case Nurse
	}
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		let subject = Subject<Professions>()
		let observer1 = Observer(name: Names.Alexander)
		let observer2 = Observer(name: Names.Dmitry)
		let observer3 = Observer(name: Names.Viktor)
		let observer4 = Observer(name: Names.Anton)

		subject.register(observer: observer1)
		subject.register(observer: observer2)
		subject.register(observer: observer3)
		subject.register(observer: observer4)

		subject.value = .Electrician
		subject.value = .Doorman
		subject.value = .Nurse

		guard let _ = (scene as? UIWindowScene) else { return }
	}

	func sceneDidDisconnect(_ scene: UIScene) {
		// Called as the scene is being released by the system.
		// This occurs shortly after the scene enters the background, or when its session is discarded.
		// Release any resources associated with this scene that can be re-created the next time the scene connects.
		// The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		// Called when the scene has moved from an inactive state to an active state.
		// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
	}

	func sceneWillResignActive(_ scene: UIScene) {
		// Called when the scene will move from an active state to an inactive state.
		// This may occur due to temporary interruptions (ex. an incoming phone call).
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		// Called as the scene transitions from the background to the foreground.
		// Use this method to undo the changes made on entering the background.
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		// Called as the scene transitions from the foreground to the background.
		// Use this method to save data, release shared resources, and store enough scene-specific state information
		// to restore the scene back to its current state.
	}


}

