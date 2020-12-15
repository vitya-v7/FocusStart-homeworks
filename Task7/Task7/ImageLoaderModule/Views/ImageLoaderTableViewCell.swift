//
//  ImageLoaderTableViewCell.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

final class ImageLoaderTableViewCell: UITableViewCell {


    // MARK: - Properties
    static var reuseIdentifier: String {
        return String(describing: ImageLoaderTableViewCell.self)
    }

    // MARK: - Views

    private let myImageView = UIImageView()


    // MARK: - Метод для конфигурации TableViewCell извне

    func setupCell(image:UIImage) {
        self.myImageView.image = image
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Добавление констрейнтов для картинки

private extension ImageLoaderTableViewCell {
    func setupElements() {
        self.setupImageView()
    }

    func setupImageView() {
        self.contentView.addSubview(self.myImageView)
        self.myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.myImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                      constant: Constants.anchorConstants),
            self.myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                      constant: -Constants.anchorConstants),
			self.myImageView.widthAnchor.constraint(equalTo: self.myImageView.heightAnchor),
			self.myImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
		self.myImageView.contentMode = .scaleAspectFill
    }

}
