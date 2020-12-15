//
//  DownloadService.swift
//  Task7
//
//  Created by Admin on 15.12.2020.
//

import UIKit

final class DownloadService {
    var downloadsSession: URLSession!
    func startDownload(_ dataModel: DataModel) {
        let download = Download(dataModel: dataModel)
		download.task = downloadsSession.downloadTask(with: dataModel.imageURL)
		download.task?.resume()
    }
}
