//
//  NewsListUseCase.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import Foundation

final class NewsListUseCase: NewsListUseCaseProtocol {

    let api: RepositoriesAPIProtocol

    init(api: RepositoriesAPIProtocol) {
        self.api = api
    }
    
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, Error>) -> Void) {
        api.getNewsStartup { response in
            completionHandler(response)
        }
    }
    
}
