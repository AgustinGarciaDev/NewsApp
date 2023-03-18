//
//  NewDetailViewController.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import UIKit

final class NewDetailViewController: UIViewController {

    var viewModel: NewDetailViewModelProtocol!

    var newUrl: String?
    var newUrlTwitter: String?

    lazy private var titleNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy private var dateNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    lazy private var contentNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy private var readMoreWebButton: UIButton = {
        let button = UIButton()
        button.setTitle("Read More in Web", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        return button
    }()

    lazy private var readMoreTwitterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Read More in Twitter", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openURLInTwitter), for: .touchUpInside)
        return button
    }()

    lazy private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleNewLabel)
        stackView.addArrangedSubview(dateNewLabel)
        stackView.addArrangedSubview(contentNewLabel)
        stackView.addArrangedSubview(readMoreTwitterButton)
        stackView.addArrangedSubview(readMoreWebButton)
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()

    static func create(with viewModel: NewDetailViewModelProtocol) -> NewDetailViewController {
        let view = NewDetailViewController()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        builHierarchy()
        setupConstraints()
        configurationInitial()
    }

    func builHierarchy() {
        view.addSubview(contentStackView)
    }

    func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        ])
    }

    func configurationInitial() {
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        configurationUI()
    }

    @objc func openURL() {
        guard let newUrl = newUrl else { return }
        openSafariURL(webUrl: newUrl)
    }

    @objc func openURLInTwitter() {
        guard let newUrlTwitter = newUrlTwitter else { return }
        openSafariURL(webUrl: String(newUrlTwitter.dropLast()))
    }
}


extension NewDetailViewController {
    func configurationUI() {
        let new = viewModel.configurationUI()
        titleNewLabel.text = new.title
        dateNewLabel.text = new.date
        contentNewLabel.text = new.content
        newUrl = new.url
        newUrlTwitter = new.readMoreUrl
    }
}
