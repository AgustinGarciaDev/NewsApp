//
//  NewListTableViewCell.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import Foundation
import UIKit

class NewListTableViewCell: UITableViewCell {

    lazy private var newImage: UIImageView = {
        let newImage = UIImageView()
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.clipsToBounds = true
        newImage.layer.cornerRadius = 100 / 2
        newImage.contentMode = .scaleAspectFill
        return newImage
    }()

    lazy private var titleNews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    private func setupView() {
        builHierarchy()
        setupConstraints()
    }

    private func builHierarchy() {
        addSubview(newImage)
        addSubview(titleNews)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            newImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            newImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            newImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            newImage.heightAnchor.constraint(equalToConstant: 100),
            newImage.widthAnchor.constraint(equalToConstant: 100),

            titleNews.topAnchor.constraint(equalTo: topAnchor),
            titleNews.leadingAnchor.constraint(equalTo: newImage.trailingAnchor, constant: 16),
            titleNews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleNews.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewListTableViewCell {
    func updatedCell(titleNew: String, imageURL: String?) {
        titleNews.text = titleNew
        newImage.imageFromURL(urlString: imageURL)
    }
}

extension UIImageView {

    func setRounded() {
        let radius = CGRectGetWidth(self.frame) / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
