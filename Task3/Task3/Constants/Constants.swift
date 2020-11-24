//
//  Constants.swift
//  Task3
//
//  Created by Admin on 24.11.2020.
//

import Foundation
import UIKit

struct FirstViewConstants
{
	private init() {}
	static let shared = FirstViewConstants()

	let firstButtonTitle = "Button1"
	let secondButtonTitle = "Button2"

	let imageViewHeight: CGFloat = 300
	let bottomAndTopSpace: CGFloat = 8
	let spaceBetweenButtons: CGFloat = 3
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

struct SecondViewConstants
{
	private init() {}
	static let shared = SecondViewConstants()

	let imageViewHeight: CGFloat = 300
	let imageMargin: CGFloat = 12
	let labelSpace: CGFloat = 15
	let titleLabel = "Header"
	let titleLabelFontSize: CGFloat = 25

}

struct ThirdViewConstants
{
	private init() {}
	static let shared = ThirdViewConstants()

	let textFieldsRelativeToSafeArea: CGFloat = 0.10
	let textFieldSpace: CGFloat = 10
	let loginTextFieldBorderWidth: CGFloat = 1
	let passwordTextFieldBorderWidth: CGFloat = 1
	let loginTextFieldBorderColor: CGColor = UIColor.systemGreen.cgColor
	let passwordTextFieldBorderColor: CGColor = UIColor.systemBlue.cgColor
	let loginFontSize: CGFloat = 17
	let passwordSize: CGFloat = 16
	let loginPlaceHolder = "Login"
	let passwordPlaceHolder = "Password"

	let imageViewHeight: CGFloat = 300
	let horizontalBigSpace: CGFloat = 32

	let buttonTitle = "Enter"
	let buttonWidthRelativeToSafeArea: CGFloat = 0.3
	let buttonHeightRelativeToSafeArea: CGFloat = 0.5
	let buttonBottomConstant: CGFloat = 12
	let buttonBorderWidth: CGFloat = 1
	let backgroundButtonColor: UIColor = .cyan
	let borderButtonColor: CGColor = UIColor.systemRed.cgColor
}
