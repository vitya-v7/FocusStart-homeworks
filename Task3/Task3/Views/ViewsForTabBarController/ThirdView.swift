//
//  FirstView.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class ThirdView: UIView {

	// MARK: Constants

	private enum Constants
	{
		static let textFieldsRelativeToSafeArea: CGFloat = 0.10
		static let textFieldSpace: CGFloat = 10
		static let loginTextFieldBorderWidth: CGFloat = 1
		static let passwordTextFieldBorderWidth: CGFloat = 1
		static let loginTextFieldBorderColor = UIColor.systemGreen.cgColor
		static let passwordTextFieldBorderColor = UIColor.systemBlue.cgColor
		static let loginFontSize: CGFloat = 17
		static let passwordSize: CGFloat = 16
		static let loginPlaceHolder = "Login"
		static let passwordPlaceHolder = "Password"

		static let imageViewHeight: CGFloat = 300
		static let horizontalBigSpace: CGFloat = 32

		static let buttonTitle = "Enter"
		static let buttonWidthRelativeToSafeArea: CGFloat = 0.3
		static let buttonHeightRelativeToSafeArea: CGFloat = 0.5
		static let buttonBottomConstant: CGFloat = 12
		static let buttonBorderWidth: CGFloat = 1
		static let backgroundButtonColor = UIColor.cyan
		static let borderButtonColor = UIColor.systemRed.cgColor
	}

	// MARK: Properties
	
	var tabBarHeight: CGFloat?
	
	private var Constraints: [NSLayoutConstraint] = []
	private var buttonBottomConstraint : NSLayoutConstraint?
	
	// MARK: Views
	
	private let loginTextField = UITextField()
	private let passwordTextField = UITextField()
	private let button = UIButton(type: .custom)
	
	// MARK: Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		configureSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Changes Cycle
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
	}
	
	// MARK: Hide Keyboard
	
	internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		endEditing(true)
	}

	func makeButtonRounded() {
		let minimum = min(button.bounds.height, button.bounds.width)
		button.layer.cornerRadius = minimum/2
	}
}

extension ThirdView: UITextFieldDelegate
{
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		endEditing(true)
		return true
	}
}

private extension ThirdView
{
	// MARK: Configuring Subviews
	
	func configureSubviews() {
		configureSuperView()
		configureLoginTextField()
		configurePasswordTextField()
		configureButton()
	}
	
	func configureSuperView() {
		backgroundColor = .systemBackground
	}
	
	func configureLoginTextField() {
		loginTextField.placeholder = Constants.loginPlaceHolder
		loginTextField.font = UIFont.systemFont(ofSize: Constants.loginFontSize)
		loginTextField.layer.borderWidth = Constants.loginTextFieldBorderWidth
		loginTextField.layer.borderColor = Constants.loginTextFieldBorderColor
		loginTextField.borderStyle = .roundedRect
		loginTextField.delegate = self
	}
	
	func configurePasswordTextField() {
		passwordTextField.placeholder = Constants.passwordPlaceHolder
		passwordTextField.font = UIFont.systemFont(ofSize: Constants.passwordSize)
		passwordTextField.layer.borderWidth = Constants.passwordTextFieldBorderWidth
		passwordTextField.layer.borderColor = Constants.passwordTextFieldBorderColor
		passwordTextField.borderStyle = .roundedRect
		passwordTextField.delegate = self
		passwordTextField.isSecureTextEntry = true
	}
	
	func configureButton() {
		button.backgroundColor = Constants.backgroundButtonColor
		button.clipsToBounds = true
		button.setTitleColor(.black, for: .normal)
		button.layer.borderWidth = Constants.buttonBorderWidth
		button.layer.borderColor = Constants.borderButtonColor
		button.setTitle(Constants.buttonTitle, for: .normal)
	}
	
	// MARK: Constraints
	
	func setupConstraints() {
		setupLoginTextFieldConstraints()
		setupPasswordTextFieldConstraints()
		setupButtonConstraints()
		NSLayoutConstraint.activate(Constraints)
	}
	
	func setupLoginTextFieldConstraints() {
		addSubview(loginTextField)
		loginTextField.translatesAutoresizingMaskIntoConstraints = false
		
		Constraints.append(contentsOf: [
			loginTextField.topAnchor.constraint(
				equalTo: safeAreaLayoutGuide.topAnchor,
				constant: Constants.textFieldSpace),
			loginTextField.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.textFieldSpace),
			loginTextField.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -Constants.textFieldSpace),
			loginTextField.heightAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.heightAnchor,
				multiplier: Constants.textFieldsRelativeToSafeArea)
		])
	}
	
	func setupPasswordTextFieldConstraints() {
		addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		
		Constraints.append(contentsOf: [
			passwordTextField.topAnchor.constraint(
				equalTo: loginTextField.bottomAnchor,
				constant: Constants.textFieldSpace),
			passwordTextField.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.textFieldSpace),
			passwordTextField.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -Constants.textFieldSpace),
			passwordTextField.heightAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.heightAnchor,
				multiplier: 0.10)
		])
	}
	
	func setupButtonConstraints() {
		addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		Constraints.append(contentsOf: [
			button.widthAnchor.constraint(
				equalTo: safeAreaLayoutGuide.widthAnchor,
				multiplier: Constants.buttonWidthRelativeToSafeArea),
			button.heightAnchor.constraint(
				equalTo: button.widthAnchor,
				multiplier: Constants.buttonHeightRelativeToSafeArea),
			button.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor)
		])
		setButtonBottomConstraint(space: 0)
	}
	
	func setButtonBottomConstraint(space: CGFloat) {
		buttonBottomConstraint = button.bottomAnchor.constraint(
			equalTo: safeAreaLayoutGuide.bottomAnchor,
			constant: -Constants.buttonBottomConstant - space)
		guard let buttonBottomConstraintIn = buttonBottomConstraint else {
			return assertionFailure("buttonBottomConstraint error in ThirdView")
		}
		NSLayoutConstraint.activate([buttonBottomConstraintIn])
	}
	
	//MARK: - Keyboard Manipulations
	
	@objc func keyboardWillShow(notification: NSNotification) {
		guard let userInfo = notification.userInfo,
			  let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
			  let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
		else {
			return
		}
		let keyboardFrame = keyboardSize.cgRectValue
		var keyboardMinusTabBarHeight: CGFloat = 0.0
		if let tabHeight = tabBarHeight {
			keyboardMinusTabBarHeight = abs(keyboardFrame.height - tabHeight)
		}
		else {
			keyboardMinusTabBarHeight = abs(keyboardFrame.height)
		}
		ThirdView.animate(withDuration: animationDuration) {
			if let buttonConstraint = self.buttonBottomConstraint {
				NSLayoutConstraint.deactivate([buttonConstraint])
				self.setButtonBottomConstraint(space: keyboardMinusTabBarHeight)
				self.layoutIfNeeded()
			}
		}
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		guard let userInfo = notification.userInfo else { return }
		guard let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
			return
		}
		
		ThirdView.animate(withDuration: animationDuration) {
			if let buttonConstraint = self.buttonBottomConstraint {
				NSLayoutConstraint.deactivate([buttonConstraint])
				self.setButtonBottomConstraint(space: 0)
				self.layoutIfNeeded()
			}
		}
	}
}
