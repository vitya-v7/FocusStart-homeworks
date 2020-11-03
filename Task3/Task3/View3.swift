//
//  View1.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class View3: UIView {

    // MARK: Properties

        private var isLayoutCompact = true

        private var sharedConstraints: [NSLayoutConstraint] = []
        private var compactConstraints: [NSLayoutConstraint] = []
        private var regularConstraints: [NSLayoutConstraint] = []

        private enum Constants: CGFloat {
            case imageViewHeight = 300
            case horizontalStandardSpace = 16
            case horizontalBigSpace = 32
            case textFieldSpace = 10
        }

        // MARK: Views

        private let loginTextField = UITextField()
        private let passwordTextField = UITextField()
        private let button = UIButton(type: .custom)
    
        // MARK: Life Cycle

        public override init(frame: CGRect) {
            super.init(frame: frame)

            setupViewsAppearances()
            setupViewsLayout()
            //changeViewsLayout(traitCollection: traitCollection)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: Changes Cycle

        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)

           // changeViewsLayout(traitCollection: traitCollection)
        }
    }

    // MARK: Appearances


private extension View3 {
    func setupViewsAppearances() {
        setupSuperViewAppearances()
        setupLoginTextFieldAppearances()
        setupPasswordTextFieldAppearances()
        setupButtonAppearances()
    }

    func setupSuperViewAppearances() {
        self.backgroundColor = .systemBackground
    }

    func setupLoginTextFieldAppearances() {
        loginTextField.placeholder = "Login"
        loginTextField.font = UIFont.systemFont(ofSize: 15)
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor.systemGreen.cgColor
        loginTextField.borderStyle = .roundedRect
    }

    func setupPasswordTextFieldAppearances() {
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.delegate = self
    }

    func setupButtonAppearances() {
        // button1.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.cornerRadius = 8
        button.backgroundColor = .cyan
        button.clipsToBounds = true
    }
    
}

// MARK: Shared Layout

private extension View3 {

    func setupViewsLayout() {
        setupSharedLayout()
    }

    func setupSharedLayout() {
        setupLoginTextFieldLayout()
        setupPasswordTextFieldLayout()
        //setupButtonLayout()
        NSLayoutConstraint.activate(sharedConstraints)
    }

    func setupLoginTextFieldLayout() {
        self.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        sharedConstraints.append(contentsOf: [
            loginTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Constants.textFieldSpace.rawValue),
            loginTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.textFieldSpace.rawValue),
            loginTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.textFieldSpace.rawValue),
        ])
    }

    func setupPasswordTextFieldLayout() {
        self.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        sharedConstraints.append(contentsOf: [
            passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: Constants.textFieldSpace.rawValue),
            passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.textFieldSpace.rawValue),
            passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.textFieldSpace.rawValue),
        ])
    }


    func setupButtonLayout() {
        //.layer.cornerRadius = self.safeAreaLayoutGuide.layoutFrame.size.height * 0.15 * 0.5
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.10),
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            button.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            button.topAnchor.constraint(
                equalTo: self.button.bottomAnchor, constant: 3
            ),
        ])
    }

}

extension View3: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTextField {
            let asteriskString = String.init(repeating: "*", count: string.count)
            if let text = textField.text,
               let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange,
                                                           with: asteriskString)
                textField.text = updatedText
            }
            return false
        }
        return true
    }
}
