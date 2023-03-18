//
//  RepositoryAPI.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

protocol RepositoriesAPIProtocol {
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, ErrorAPINew>) -> Void)
}

class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    
    func getNewsStartup(completionHandler: @escaping (Result<NewsModel, ErrorAPINew>) -> Void) {
        fetchData(target: .getNewsStartup, responseClass: NewsModel.self) { result in
            completionHandler(result)
        }
    }
}
