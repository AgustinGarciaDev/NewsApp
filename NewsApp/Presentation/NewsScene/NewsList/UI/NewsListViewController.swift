//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import UIKit

final class NewsListViewController: UIViewController {

    var viewModel: NewsListViewModelProtocol!

    static func create(with viewModel: NewsListViewModelProtocol) -> NewsListViewController {
        let view = NewsListViewController()
        view.viewModel = viewModel
        return view
    }

    lazy private var titleHome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Startups News"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()

    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewListTableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        builHierarchy()
        setupConstraints()
        configurationInitial()
    }

    func configurationInitial() {
        navigationController?.navigationBar.isHidden = true
        viewModel.view = self
    }

    func builHierarchy() {
        view.addSubview(titleHome)
        view.addSubview(tableView)
    }

    func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleHome.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            titleHome.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            titleHome.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),

            tableView.topAnchor.constraint(equalTo: titleHome.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }

}

extension NewsListViewController: NewsListViewUpdatedProtocol {
    func updatedTableView() {
        tableView.reloadData()
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNewsList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.getNewsList()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! NewListTableViewCell
        cell.updatedCell(titleNew: item.title ?? "", imageURL: item.imageUrl)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
}
