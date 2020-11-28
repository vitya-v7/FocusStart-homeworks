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
		guard let image = UIImage(named: rawValue) else {
			assertionFailure("rawValue does not exist in Image file");
			return UIImage()
		}
		return image
	}
}
