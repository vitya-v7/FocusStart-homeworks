//
//  Image.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

enum Images: String {
    case test
    var image: UIImage {
        guard let image = UIImage(named: self.rawValue) else { assertionFailure(); return UIImage() }
        return image
    }
}
