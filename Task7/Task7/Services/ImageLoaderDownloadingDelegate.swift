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

}
