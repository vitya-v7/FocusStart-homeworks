//
//  Download.swift
//  Task7
//
//  Created by Admin on 15.12.2020.
//

import UIKit

final class Download {
    var task: URLSessionDownloadTask?
    var dataModel: DataModel

    init(dataModel: DataModel) {
      self.dataModel = dataModel
    }
}
