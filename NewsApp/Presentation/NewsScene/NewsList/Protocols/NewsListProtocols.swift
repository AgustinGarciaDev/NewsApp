//
//  NewsListProtocols.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import Foundation

protocol NewsListViewUpdatedProtocol {
    func updatedTableView()
}

protocol NewsListViewModelProtocol {
    var view: NewsListViewUpdatedProtocol? {get set}
    var coordinator: Coordinator? {get set}
    func getNewsList() -> [InfoNew]
    func requestNewsStartup()
    func didSelectItem(at index: Int)

}

protocol NewsListUseCaseProtocol {
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, Error>) -> Void)
}


