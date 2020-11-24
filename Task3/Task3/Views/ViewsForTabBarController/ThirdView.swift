//
//  FirstView.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class ThirdView: UIView {
	
	// MARK: Properties
	
	var tabBarHeight: CGFloat?
	
	private var Constraints: [NSLayoutConstraint] = []
	private var buttonBottomConstraint : NSLayoutConstraint?
	
	// MARK: Views
	
	private let loginTextField = UITextField()
	private let passwordTextField = UITextField()
	private let button = UIButton(type: .custom)
	
	// MARK: Life Cycle
	
	public override init(frame: CGRect) {
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
		loginTextField.placeholder = ThirdViewConstants.shared.loginPlaceHolder
		loginTextField.font = UIFont.systemFont(ofSize: ThirdViewConstants.shared.loginFontSize)
		loginTextField.layer.borderWidth = ThirdViewConstants.shared.loginTextFieldBorderWidth
		loginTextField.layer.borderColor = ThirdViewConstants.shared.loginTextFieldBorderColor
		loginTextField.borderStyle = .roundedRect
		loginTextField.delegate = self
	}
	
	func configurePasswordTextField() {
		passwordTextField.placeholder = ThirdViewConstants.shared.passwordPlaceHolder
		passwordTextField.font = UIFont.systemFont(ofSize: ThirdViewConstants.shared.passwordSize)
		passwordTextField.layer.borderWidth = ThirdViewConstants.shared.passwordTextFieldBorderWidth
		passwordTextField.layer.borderColor = ThirdViewConstants.shared.passwordTextFieldBorderColor
		passwordTextField.borderStyle = .roundedRect
		passwordTextField.delegate = self
		passwordTextField.isSecureTextEntry = true
	}
	
	func configureButton() {
		button.backgroundColor = ThirdViewConstants.shared.backgroundButtonColor
		button.clipsToBounds = true
		button.setTitleColor(.black, for: .normal)
		button.layer.borderWidth = ThirdViewConstants.shared.buttonBorderWidth
		button.layer.borderColor = ThirdViewConstants.shared.borderButtonColor
		button.setTitle(ThirdViewConstants.shared.buttonTitle, for: .normal)
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
				constant: ThirdViewConstants.shared.textFieldSpace),
			loginTextField.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: ThirdViewConstants.shared.textFieldSpace),
			loginTextField.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -ThirdViewConstants.shared.textFieldSpace),
			loginTextField.heightAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.heightAnchor,
				multiplier: ThirdViewConstants.shared.textFieldsRelativeToSafeArea)
		])
	}
	
	func setupPasswordTextFieldConstraints() {
		addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		
		Constraints.append(contentsOf: [
			passwordTextField.topAnchor.constraint(
				equalTo: loginTextField.bottomAnchor,
				constant: ThirdViewConstants.shared.textFieldSpace),
			passwordTextField.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: ThirdViewConstants.shared.textFieldSpace),
			passwordTextField.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -ThirdViewConstants.shared.textFieldSpace),
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
				multiplier: ThirdViewConstants.shared.buttonWidthRelativeToSafeArea),
			button.heightAnchor.constraint(
				equalTo: button.widthAnchor,
				multiplier: ThirdViewConstants.shared.buttonHeightRelativeToSafeArea),
			button.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor)
		])
		setButtonBottomConstraint(space: 0)
	}
	
	func setButtonBottomConstraint(space: CGFloat) {
		buttonBottomConstraint = button.bottomAnchor.constraint(
			equalTo: safeAreaLayoutGuide.bottomAnchor,
			constant: -ThirdViewConstants.shared.buttonBottomConstant - space)
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
