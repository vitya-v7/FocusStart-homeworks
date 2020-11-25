//
//  Constants.swift
//  Task3
//
//  Created by Admin on 24.11.2020.
//

import Foundation
import UIKit

struct Constants
{
	private init() {}
	static let shared = Constants()

	let firstButtonTitle = "Button1"
	let secondButtonTitle = "Button2"

	let imageViewHeightRelativeToSafeArea: CGFloat = 0.20

	let bottomAndTopSpace: CGFloat = 5
	let labelFontSize: CGFloat = 14

	let buttonFontSize: CGFloat = 10
	let button1BorderWidth: CGFloat = 1
	let backgroundButton1Color: UIColor = .cyan
	let borderButton1Color: CGColor = UIColor.systemRed.cgColor
	let button1HeightRelativeToSafeArea: CGFloat = 0.10
	let button1WidthRelativeToSafeArea: CGFloat = 0.7

	let button2HeightRelativeToSafeArea: CGFloat = 0.10
	let button2BorderWidth: CGFloat = 1
	let backgroundButton2Color: UIColor = .systemRed
	let borderButton2Color: CGColor = UIColor.systemGreen.cgColor

	let label1HeightRelativeToSafeArea: CGFloat = 0.05
	let label2HeightRelativeToSafeArea: CGFloat = 0.15
	let label3HeightRelativeToSafeArea: CGFloat = 0.26
}

