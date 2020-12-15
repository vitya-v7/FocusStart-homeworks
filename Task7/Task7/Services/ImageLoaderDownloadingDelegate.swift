//
//  ImageLoaderDownloadingDelegate.swift
//  Task7
//
//  Created by Admin on 15.12.2020.
//

import Foundation

final class ImageDownloadingDelegate: NSObject {

    private let downloadService = DownloadService()
    private var downloadsSession: URLSession?

	override init() {
        super.init()
		let configuration = URLSessionConfiguration.background(withIdentifier: "com.viktor.Task7")
		downloadsSession = URLSession(configuration: configuration,
						  delegate: self,
						  delegateQueue: nil)
        self.downloadService.downloadsSession = downloadsSession
    }

    func startLoading(with dataModel: DataModel) {
		downloadService.startDownload(dataModel)
    }

    private func localFilePath(for url: URL) -> URL {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
}

extension ImageDownloadingDelegate: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {

        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }

        let destinationURL = localFilePath(for: sourceURL)
        print("File destination: : ",destinationURL)

        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)

        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch {
            assertionFailure("I can't save the image")
        }
    }
}
