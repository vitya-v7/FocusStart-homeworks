//
//  DataTaskService.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

final class DataTaskService: NSObject, URLSessionDataDelegate {
	var downloadSession: URLSession?
	var destinationURL: URL?
	var dataTask: URLSessionDataTask?
	var configuration: URLSessionConfiguration?
	var completionHandler: ((_ image: UIImage) -> ())?
	
	func launchTask(url: URL) {
		configSession()
		createRequest(url: url)
	}

	func configSession() {
		configuration = URLSessionConfiguration.background(withIdentifier:"com.viktor.Task7")

		if let _ = configuration {
			self.configuration!.isDiscretionary = true
			self.configuration!.sessionSendsLaunchEvents = true

			self.configuration!.allowsCellularAccess = true
			self.configuration!.shouldUseExtendedBackgroundIdleMode = true
			self.configuration!.waitsForConnectivity = true
			
		}
		downloadSession = URLSession(configuration: configuration!, delegate: self, delegateQueue: nil)
	}

	func createRequest(url: URL) {
		let urlRequest = URLRequest.init(url: url)
		let task = downloadSession!.downloadTask(with: urlRequest)
		task.resume()
	}

	private func localFilePath(for url: URL) -> URL {
		let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		return documentsPath.appendingPathComponent(url.lastPathComponent)
	}
}

extension DataTaskService: URLSessionDownloadDelegate {
	
	func urlSession(_ session: URLSession,
					downloadTask: URLSessionDownloadTask,
					didFinishDownloadingTo location: URL) {

		guard let sourceURL = downloadTask.originalRequest?.url else {
			return
		}

		destinationURL = localFilePath(for: sourceURL)

		let fileManager = FileManager.default
		try? fileManager.removeItem(at: destinationURL!)
		do {
			try fileManager.copyItem(at: location, to: destinationURL!)
		} catch {
			assertionFailure("I can't save the image")
		}
		let imageNSData = NSData(contentsOf: destinationURL!)
		let imageData = Data(referencing: imageNSData!)
		let image = UIImage.init(data: imageData)
		completionHandler!(image!)
	}

	func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
		DispatchQueue.main.async {
			AppDelegate.backgroundSessionCompletionHandler!()
		}
	}
}
