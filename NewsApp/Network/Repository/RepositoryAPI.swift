//
//  RepositoryAPI.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

protocol RepositoriesAPIProtocol {
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, Error>) -> Void)
}

class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, Error>) -> Void) {
        fetchData(target: .getNewsStartup, responseClass: NewsModel.self) { result in
            completionHandler(result)
        }
    }
}
