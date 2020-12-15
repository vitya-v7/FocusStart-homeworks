//
//  ImageLoaderTableViewDataSource.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

final class ImageLoaderTableViewDataSource: NSObject {

    // MARK: Properties
    var dataArray = [DataViewModel]()
}

// MARK: UITableViewDataSource
extension ImageLoaderTableViewDataSource: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ImageLoaderTableViewCell.reuseIdentifier,
                for: indexPath) as? ImageLoaderTableViewCell
        else {
            assertionFailure(); return UITableViewCell()
        }

        if indexPath.row < dataArray.count {
			let image = dataArray[indexPath.row].image
            cell.setupCell(image:image)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
