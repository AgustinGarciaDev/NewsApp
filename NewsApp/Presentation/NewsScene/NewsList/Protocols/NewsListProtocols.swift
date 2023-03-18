//
//  NewsListProtocols.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import Foundation

protocol NewsListViewUpdatedProtocol {
    func updatedTableView()
    func error(with error: String)
}

protocol NewsListViewModelProtocol {
    var view: NewsListViewUpdatedProtocol? {get set}
    var coordinator: Coordinator? {get set}
    var errorTitle: String {get set}
    func getNewsList() -> [InfoNew]
    func requestNewsStartup()
    func didSelectItem(at index: Int)
}

protocol NewsListUseCaseProtocol {
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, ErrorAPINew>) -> Void)
}


