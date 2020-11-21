//
//  Constants.swift
//  Task4
//
//  Created by Admin on 07.11.2020.
//

import Foundation
import UIKit

public enum ImagesNames: String {
	case DogName = "cute-dog"
	case RatName = "cute-rat"
	case PandaName = "cute-panda"
	case BelkaName = "cute-belka"
	case KosulaName = "cute-kosula"
	case LionName = "cute-lion"
	case WolfName = "cute-wolf"
	case CatName = "cute-cat"
	case HorsesName = "cute-horses"
	case BearName = "cute-bear"
}

public struct Constants {
	static let bottomAndTopSpace: CGFloat  = 10
	static let leftAndRight: CGFloat  = 20
	static let standardSpace: CGFloat  = 5
	static let largeSpace: CGFloat  = 60
	static let estimatedCellHeight: CGFloat = 100
}

public struct ConstantsForFontSize {
	static let descriptionLabelFontSize: CGFloat = 20
	static let titleInDetailLabelFontSize: CGFloat = 16
	static let dateFontInCellSize: CGFloat = 12
	static let titleFontInCellSize: CGFloat = 20
	static let descriptionFontInCellSize: CGFloat = 20
}

public struct ConstantsForImage {
	static let cornerRadius: CGFloat = 12
	static let shadowColor: UIColor = .black
	static let shadowRadius: CGFloat = 8
	static let shadowOpacity: Float = 0.6
	static let shadowOffset: CGSize = CGSize(width: 8, height: 8)
	static let imageOpacity: Float = 0.75
}
